class CreateMonthlyResultAverages < ActiveRecord::Migration[8.0]
  def change
    create_table :monthly_result_averages do |t|
      t.date :month
      t.string :subject
      t.float :average_daily_high
      t.float :average_daily_low
      t.integer :total_result_count
      t.integer :days_used

      t.timestamps
    end
  end
end
