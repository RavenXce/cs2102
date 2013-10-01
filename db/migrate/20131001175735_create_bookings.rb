class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :reference_id
      t.string :destination
      t.string :origin
      t.boolean :is_two_way

      t.timestamps
    end
  end
end
