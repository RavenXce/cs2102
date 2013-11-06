class AddPriceColumnToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :price, :decimal, :precision => 6,:scale => 2
  end
end
