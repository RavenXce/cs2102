class ExtendPriceColumnsRange < ActiveRecord::Migration
  def change
    change_column :bookings, :price, :decimal, :precision => 10, :scale => 2
    change_column :flights, :price, :decimal, :precision => 10, :scale => 2
  end
end
