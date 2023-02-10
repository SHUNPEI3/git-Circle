class CreateGoods < ActiveRecord::Migration[6.1]
  def change
    create_table :goods do |t|
      t.integer :end_user_id,      null: false
      t.integer :topic_comment_id, null: false

      t.timestamps
    end
  end
end
