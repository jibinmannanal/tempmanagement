class CreateSevaTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :seva_times do |t|
      t.jsonb :time
      t.integer :seva_id
    end
  end
end
