class CreateExceptionDates < ActiveRecord::Migration[6.0]
  def change
    create_table :exception_dates do |t|
      t.string :name
      t.jsonb :dates

      t.timestamps
    end
  end
end
