class CreateJoinTableExceptionDateSeva < ActiveRecord::Migration[6.0]
  def change
    create_join_table :exception_dates, :sevas do |t|
      # t.index [:exception_date_id, :seva_id]
      # t.index [:seva_id, :exception_date_id]
    end
  end
end
