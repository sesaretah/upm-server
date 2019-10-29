class AddChannelIdToShare < ActiveRecord::Migration[5.2]
  def change
    add_column :shares, :channel_id, :integer
  end
end
