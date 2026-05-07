require "rails_helper"

RSpec.describe DailyStatisticsCalculator do
  describe ".call" do
    let(:date) { Date.new(2026, 5, 7) }

    before do
      TestResult.create!(
        student_name: "A",
        subject: "Math",
        marks: 80,
        submitted_at: date.to_datetime.change(hour: 10)
      )

      TestResult.create!(
        student_name: "B",
        subject: "Math",
        marks: 95,
        submitted_at: date.to_datetime.change(hour: 12)
      )

      TestResult.create!(
        student_name: "C",
        subject: "Math",
        marks: 60,
        submitted_at: date.to_datetime.change(hour: 14)
      )
    end

    it "creates daily statistics for the subject" do
      expect {
        described_class.call(date)
      }.to change(DailyResultStatistic, :count).by(1)

      stat = DailyResultStatistic.last

      expect(stat.subject).to eq("Math")
      expect(stat.daily_low).to eq(60)
      expect(stat.daily_high).to eq(95)
      expect(stat.result_count).to eq(3)
      expect(stat.date).to eq(date)
    end
  end
end
