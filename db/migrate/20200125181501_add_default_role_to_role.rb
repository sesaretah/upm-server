class AddDefaultRoleToRole < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :default_role, :boolean
  end
end
