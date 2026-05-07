class DailyStatisticsCalculator
  def self.call(date)
    TestResult
      .where(submitted_at: date.all_day)
      .group(:subject)
      .pluck(
        :subject,
        Arel.sql("MIN(marks)"),
        Arel.sql("MAX(marks)"),
        Arel.sql("COUNT(*)")
      )
      .each do |subject, low, high, count|

        DailyResultStatistic.find_or_initialize_by(
          date: date,
          subject: subject
        ).update!(
          daily_low: low,
          daily_high: high,
          result_count: count
        )
      end
  end
end
