class AddLabelToMeta < ActiveRecord::Migration[5.2]
  def change
    add_column :meta, :label, :string
  end
end
