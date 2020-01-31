class CreateActuals < ActiveRecord::Migration[5.2]
  def change
    create_table :actuals do |t|
      t.integer :meta_id
      t.integer :user_id
      t.json :content

      t.timestamps
    end
  end
end
