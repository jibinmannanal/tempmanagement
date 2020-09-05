class AddAttributesToSevas < ActiveRecord::Migration[6.0]
  def change
    add_column :sevas, :event_type, :string
    add_column :sevas, :additional_data, :jsonb
  end
end
