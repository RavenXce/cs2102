class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :ticket_no
      t.integer :booking_id
      t.string :seat_number
      t.integer :flight_id
      t.string :passenger_id
      t.string :passenger_nationality

      t.timestamps
    end
  end
end
