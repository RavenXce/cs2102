class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :flight_id
      t.string :flight_number
      t.string :airline
      t.timestamp :departure_time
      t.timestamp :arrival_time
      t.string :departure_location
      t.string :arrival_location
      t.string :departure_gate
      t.string :arrival_gate
      t.string :departure_terminal
      t.string :arrival_terminal

      t.timestamps
    end
  end
end
