class AddUserIdToFamilyMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :family_members, :user_id, :integer
  end
end
