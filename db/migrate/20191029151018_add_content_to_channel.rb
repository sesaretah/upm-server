class AddContentToChannel < ActiveRecord::Migration[5.2]
  def change
    add_column :channels, :content, :string
  end
end
