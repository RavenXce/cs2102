class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :iata_code
      t.string :icao_code
      t.string :name
      t.string :country
      t.string :state
      t.string :city

      t.timestamps
    end
  end
end
