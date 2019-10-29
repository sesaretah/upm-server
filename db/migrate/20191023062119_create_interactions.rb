class CreateInteractions < ActiveRecord::Migration[5.2]
  def change
    create_table :interactions do |t|
      t.string :interaction_type
      t.integer :interactionable_id
      t.string :interactionble_type
      t.integer :user_id

      t.timestamps
    end
  end
end
