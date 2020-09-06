class CreateSevaTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :seva_types do |t|
      t.string :name
    end
  end
end