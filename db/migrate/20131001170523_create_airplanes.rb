class CreateAirplanes < ActiveRecord::Migration
  def change
    create_table :airplanes do |t|
      t.string :manufacturer
      t.string :model
      t.integer :standard_capacity

      t.timestamps
    end
    add_index :airplanes, [:manufacturer, :model], :unique => true
  end
end
