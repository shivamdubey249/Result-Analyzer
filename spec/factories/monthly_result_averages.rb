FactoryBot.define do
  factory :monthly_result_average do
    month { "2026-05-07" }
    subject { "MyString" }
    average_daily_high { 1.5 }
    average_daily_low { 1.5 }
    total_result_count { 1 }
    days_used { 1 }
  end
end
