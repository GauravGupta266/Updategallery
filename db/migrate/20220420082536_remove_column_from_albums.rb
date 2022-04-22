class RemoveColumnFromAlbums < ActiveRecord::Migration[7.0]
  def change
    remove_column :albums, :tag, :string
  end
end
