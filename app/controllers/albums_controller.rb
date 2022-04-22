  class AlbumsController < ApplicationController
    before_action :authenticate_user!
    def index
      @albums = current_user.albums
    end

    def show
      @album=Album.find(params[:id])
    end

    def new 
      @album=Album.new
    end
  
    def create
      @album = current_user.albums.new(album_params)
      if @album.save
        MessageMailer.index.deliver_now
        # NotificationMailer.album_notification(current_user.email).deliver_now if @album.published?
        redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @album = Album.find(params[:id])
    end

    def update
      @album = Album.find(params[:id])

      if @album.update(album_params)
        redirect_to root_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @album = Album.find(params[:id])
      @album.destroy
      redirect_to root_path, status: :see_other
    end

    def purge
      # album = Album.find(params[:id])
      attachment = ActiveStorage::Attachment.find(params[:attachment_id])
      attachment.purge
      redirect_to root_path
    end 

    private
      def album_params
        params.require(:album).permit(:title, :description, :all_tags, :published, :cover_image, :images=> [])
      end
  end
