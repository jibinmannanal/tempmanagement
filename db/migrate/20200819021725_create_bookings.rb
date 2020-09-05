class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :seva_id
      t.jsonb :devote_list
      t.string :booking_type
      t.float :rate
      t.jsonb :seva_date
      t.timestamps
    end
  end
end
