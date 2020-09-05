class AddCloumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nakshatra, :string
    add_column :users, :dob, :datetime
    add_column :users, :mobile, :string
  end
end
