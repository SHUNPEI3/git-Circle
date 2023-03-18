class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id,      null: false
      t.integer :visited_id,      null: false
      t.integer :community_id
      t.integer :topic_id
      t.integer :topic_comment_id
      t.string :action,           null: false, default: ""
      t.boolean :checked,         null: false, default: false

      t.timestamps
    end
  end
end
