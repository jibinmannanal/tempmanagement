class AddColumnToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :tirtha_prasada_amount, :float
    add_column :bookings, :lunch, :boolean
    add_column :bookings, :tirtha_prasada_count, :integer
  end
end
