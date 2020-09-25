class AddTirthaPrasadaAmountToSevas < ActiveRecord::Migration[6.0]
  def change
    add_column :sevas, :tirtha_prasada_amount, :integer, :null => false, :default => 0
  end
end
