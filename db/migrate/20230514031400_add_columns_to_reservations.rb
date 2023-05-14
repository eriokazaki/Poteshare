class AddColumnsToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :total_day, :integer
    add_column :reservations, :total_price, :integer 
  end
end
