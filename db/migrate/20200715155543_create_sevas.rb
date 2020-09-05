class CreateSevas < ActiveRecord::Migration[6.0]
  def change
    create_table :sevas do |t|
      t.string :name
      t.text :instructions
      t.float :rate
      t.string :identification_number
      t.string :status
      t.jsonb :audit_logs

      t.timestamps
    end
  end
end
