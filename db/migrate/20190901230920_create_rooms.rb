class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :location
      t.boolean :performance_charge

      t.timestamps null: false
    end
  end
end
