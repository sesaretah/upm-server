class AddUuidToActual < ActiveRecord::Migration[5.2]
  def change
    add_column :actuals, :uuid, :string
    add_index :actuals, :uuid, unique: true
  end
end
