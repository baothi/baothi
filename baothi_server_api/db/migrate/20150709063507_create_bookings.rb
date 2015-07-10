class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :driver_id
      t.integer :status
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :distance
      
      t.timestamps null: false
    end
  end
end
