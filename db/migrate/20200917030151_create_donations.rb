class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.string :name
      t.text :address
      t.float :amount
      t.integer :user_id
      t.string :purpose
      t.string :payment_type
      t.string :payment_method
      t.string :check_no
      t.date :check_expiry_date
      t.string :transaction_id

      t.timestamps
    end
  end
end
