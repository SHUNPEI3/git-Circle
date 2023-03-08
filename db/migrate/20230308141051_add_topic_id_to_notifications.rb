class AddTopicIdToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :topic_id, :integer
  end
end
