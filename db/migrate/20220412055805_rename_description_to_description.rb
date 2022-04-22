class RenameDescriptionToDescription < ActiveRecord::Migration[7.0]
  def change
    rename_column :albums, :Description, :description
  end
end
