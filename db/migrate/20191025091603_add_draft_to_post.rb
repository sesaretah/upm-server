class AddDraftToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :draft, :json
  end
end
