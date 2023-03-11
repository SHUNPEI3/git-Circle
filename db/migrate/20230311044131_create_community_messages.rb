class CreateCommunityMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :community_messages do |t|
      t.integer :end_user_id,  null: false
      t.integer :community_id, null: false
      t.text :message,         null: false
      t.integer :parent_id
      t.boolean :is_active,    null: false, default: true

      t.timestamps
    end
  end
end
