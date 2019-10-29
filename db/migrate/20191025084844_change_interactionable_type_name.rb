class ChangeInteractionableTypeName < ActiveRecord::Migration[5.2]
  def change
    rename_column :interactions, :interactionble_type, :interactionable_type
  end
end
