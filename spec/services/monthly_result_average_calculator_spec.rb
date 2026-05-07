require "rails_helper"

RSpec.describe MonthlyResultAverageCalculator do
  describe ".call" do
    let(:date) { Date.new(2026, 5, 25) }

    before do
      5.times do |i|
        DailyResultStatistic.create!(
          date: date - i.days,
          subject: "Math",
          daily_low: 60,
          daily_high: 90,
          result_count: 50
        )
      end
    end

    it "creates monthly average" do
      expect {
        described_class.call(date)
      }.to change(MonthlyResultAverage, :count).by(1)

      result = MonthlyResultAverage.last

      expect(result.average_daily_low).to eq(60.0)
      expect(result.average_daily_high).to eq(90.0)
      expect(result.total_result_count).to eq(250)
      expect(result.days_used).to eq(5)
    end

    it "extends beyond 5 days if total count is below 200" do
      DailyResultStatistic.delete_all

      6.times do |i|
        DailyResultStatistic.create!(
          date: date - i.days,
          subject: "Math",
          daily_low: 50,
          daily_high: 80,
          result_count: 30
        )
      end

      described_class.call(date)

      result = MonthlyResultAverage.last

      expect(result.total_result_count).to be >= 180
      expect(result.days_used).to eq(6)
    end
  end
end
