class AddPriceColumnToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :price, :decimal, :precision => 6,:scale => 2
    add_column :flights, :capacity, :integer
  end
end
