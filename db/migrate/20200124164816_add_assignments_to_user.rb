class AddAssignmentsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :assignments, :json
  end
end
