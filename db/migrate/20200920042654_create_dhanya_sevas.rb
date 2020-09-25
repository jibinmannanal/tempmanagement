class CreateDhanyaSevas < ActiveRecord::Migration[6.0]
  def change
    create_table :dhanya_sevas do |t|
      t.jsonb :item
      t.text :remarks
      t.string :total_worth
        t.string :name
      t.integer :user_id
      t.timestamps
    end
  end
end
