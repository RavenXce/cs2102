class RemoveUselessStuff < ActiveRecord::Migration
  def change
    drop_table :airplanes
    drop_table :seats
    remove_column :tickets, :ticket_no
  end
end
