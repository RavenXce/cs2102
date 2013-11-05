class DropUselessColumnsFromAirportTable < ActiveRecord::Migration
  def change
    remove_column :airports, :icao_code
    remove_column :airports, :state
    add_column :airports, :country_code, :string
  end
end
