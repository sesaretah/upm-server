class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.string :shareble_type
      t.integer :shareable_id
      t.integer :user_id

      t.timestamps
    end
  end
end
