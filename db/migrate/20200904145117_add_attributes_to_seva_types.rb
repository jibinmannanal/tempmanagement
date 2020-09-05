class AddAttributesToSevaTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :seva_types, :group_booking, :boolean
    add_column :seva_types, :maximum_number_per_booking, :integer
  end
end
