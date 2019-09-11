class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :username
      t.text :password_digest
      t.text :email
      t.string :name
      t.string :image
      t.string :uid
      
      t.timestamps null: false
    end
  end
end
