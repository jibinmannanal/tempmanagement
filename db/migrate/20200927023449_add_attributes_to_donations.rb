class AddAttributesToDonations < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :email, :string
    add_column :donations, :phone, :string
    add_column :donations, :remarks, :text
    add_column :donations, :received_by, :string
  end
end
