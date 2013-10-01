class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.string :passport_no
      t.string :nationality
      t.string :address
      t.string :country
      t.string :name
      t.datetime :dob

      t.timestamps
    end
  end
end
