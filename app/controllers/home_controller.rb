class HomeController < ApplicationController
  def index
    if user_signed_in?
      @albums = current_user.albums
      redirect_to :albums
    else
      @albums = Album.where(published: true)
    end
    @q = @albums.ransack(params[:q])
    @albums = @q.result
  end
end
