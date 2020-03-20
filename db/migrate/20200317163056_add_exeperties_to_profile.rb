class AddExepertiesToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :experties, :json
  end
end
