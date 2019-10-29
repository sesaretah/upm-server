class RenameSharableType < ActiveRecord::Migration[5.2]
  def change
    rename_column :shares, :shareble_type, :shareable_type
  end
end
