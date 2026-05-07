class MonthlyResultAverage < ApplicationRecord
  validates :month, :subject, presence: true
end
