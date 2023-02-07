class CreateCommunities < ActiveRecord::Migration[6.1]
  def change
    create_table :communities do |t|
      t.string  :name,        null: false
      t.text    :introductio, null: false
      t.integer :owner_id,    null: false
      
      t.timestamps
    end
  end
end
