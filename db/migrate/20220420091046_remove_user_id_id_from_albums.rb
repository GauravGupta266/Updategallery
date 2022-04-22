class RemoveUserIdIdFromAlbums < ActiveRecord::Migration[7.0]
  def change
    remove_column :albums, :user_id_id, :string
  end
end
