class AddAttributesToFamilyMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :family_members, :gotra, :string
    add_column :family_members, :rashi, :string
  end
end
