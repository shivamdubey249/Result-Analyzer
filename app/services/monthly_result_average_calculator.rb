class MonthlyResultAverageCalculator
  def self.call(month_date)
    DailyResultStatistic
      .select(:subject)
      .distinct
      .pluck(:subject)
      .each do |subject|

        stats = DailyResultStatistic
                  .where(subject: subject)
                  .where("date <= ?", month_date)
                  .order(date: :desc)
                  .to_a

        selected = stats.first(5)

        while selected.sum(&:result_count) < 200 && selected.size < stats.size
          selected << stats[selected.size]
        end

        next if selected.empty?

        MonthlyResultAverage.find_or_initialize_by(
          month: month_date.beginning_of_month,
          subject: subject
        ).update!(
          average_daily_high: selected.sum(&:daily_high).to_f / selected.size,
          average_daily_low: selected.sum(&:daily_low).to_f / selected.size,
          total_result_count: selected.sum(&:result_count),
          days_used: selected.size
        )
      end
  end
end
