class RenamePublishToPublished < ActiveRecord::Migration[7.0]
  def change
    rename_column :albums, :publish, :published
  end
end
