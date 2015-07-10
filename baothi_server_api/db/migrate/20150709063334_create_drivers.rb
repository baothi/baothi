class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :name
      t.integer :gender
      t.datetime :birthday
      t.string :phone_number
      t.string :taxi_number
      t.string :company
      t.integer :sit_number
      t.float :latitude
      t.float :longitude
      t.string :address
      t.integer :current_guest
      t.integer :status, :default => 0
      t.string :driver_code
      
      t.timestamps null: false
    end
  end
end
