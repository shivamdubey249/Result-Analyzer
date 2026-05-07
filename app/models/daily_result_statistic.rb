class DailyResultStatistic < ApplicationRecord
  validates :date, :subject, presence: true
end
