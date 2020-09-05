class AddTimingToSevas < ActiveRecord::Migration[6.0]
  def change
    add_column :sevas, :timing, :jsonb
  end
end
