class CreateEventTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :event_types do |t|
      t.string :type
      t.jsonb :exception_date
      t.jsonb :occurrence_date

      t.timestamps
    end
  end
end
