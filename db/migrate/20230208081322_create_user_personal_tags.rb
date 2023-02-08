class CreateUserPersonalTags < ActiveRecord::Migration[6.1]
  def change
    create_table :user_personal_tags do |t|
      t.integer :end_user_id,     null: false
      t.integer :personal_tag_id, null: false

      t.timestamps
    end
  end
end
