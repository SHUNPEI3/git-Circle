class CreateTopicComments < ActiveRecord::Migration[6.1]
  def change
    create_table :topic_comments do |t|
      t.integer :end_user_id,  null: false
      t.integer :community_id, null: false
      t.integer :topic_id,     null: false
      t.text :comment,         null: false
      t.boolean :is_active,    null: false, default: true

      t.timestamps
    end
  end
end
