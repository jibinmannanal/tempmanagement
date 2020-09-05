class AddAttributesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :gotra, :string
    add_column :users, :rashi, :string
  end
end
