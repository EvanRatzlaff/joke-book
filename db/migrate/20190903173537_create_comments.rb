class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :joke_id
      t.integer :user_id
      t.integer :room_id
      t.timestamps
    end
  end
end
