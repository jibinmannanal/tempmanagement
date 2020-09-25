class AddNoOfPersonsToSevas < ActiveRecord::Migration[6.0]
  def change
    add_column :sevas, :no_of_persons, :integer, :null => false, :default => 0
  
  end
end
