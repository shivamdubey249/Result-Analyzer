class IndexToDailyResultAndMonthlyResult < ActiveRecord::Migration[8.0]
  def change
    add_index :daily_result_statistics, [:date, :subject], unique: true
    add_index :monthly_result_averages, [:month, :subject], unique: true
  end
end
