class CreateCommunityDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :community_details do |t|
      t.integer :community_id,    null: false
      t.integer :max_join_number
      t.integer :sex_limit,       null: false
      t.integer :residence_limit, null: false
      t.integer :age_min_limit
      t.integer :age_max_limit
      t.timestamps
    end
  end
end
