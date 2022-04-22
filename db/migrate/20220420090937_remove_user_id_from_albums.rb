class RemoveUserIdFromAlbums < ActiveRecord::Migration[7.0]
  def change
    remove_column :albums, :user_id, :string
  end
end
