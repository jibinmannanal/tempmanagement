class AddSeveTypeIdToSevas < ActiveRecord::Migration[6.0]
  def change
    add_column :sevas, :seva_type_id, :string
  end
end
