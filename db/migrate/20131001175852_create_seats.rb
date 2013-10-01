class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :flight_id
      t.string :seat_number
      t.string :seat_type
      t.decimal :price

      t.timestamps
    end
  end
end
