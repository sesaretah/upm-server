class CreateMeta < ActiveRecord::Migration[5.2]
  def change
    create_table :meta do |t|
      t.string :meta_type
      t.integer :user_id
      t.json :meta_schema
      t.string :title

      t.timestamps
    end
  end
end
