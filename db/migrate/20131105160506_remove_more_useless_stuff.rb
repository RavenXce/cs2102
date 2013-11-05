class RemoveMoreUselessStuff < ActiveRecord::Migration
  def change
    remove_column :users, :user_id
    remove_column :flights, :flight_id
    remove_column :tickets, :passenger_nationality    
  end
end
