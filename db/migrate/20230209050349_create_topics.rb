class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.integer :end_user_id,  null: false
      t.integer :community_id, null: false
      t.string :title,         null: false
      t.text :body,            null: false

      t.timestamps
    end
  end
end
