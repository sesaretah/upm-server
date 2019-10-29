class CreateAuxiliaryRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :auxiliary_records do |t|
      t.integer :auxiliary_table_id
      t.string :uuid
      t.json :data_record
      t.string :title
      t.integer :model_id
      t.string :model_type

      t.timestamps
    end
  end
end
