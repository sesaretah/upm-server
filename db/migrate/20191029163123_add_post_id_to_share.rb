class AddPostIdToShare < ActiveRecord::Migration[5.2]
  def change
    add_column :shares, :post_id, :integer
  end
end
