class TestResult < ApplicationRecord
  validates :student_name, :subject, :submitted_at, presence: true
  validates :marks, presence: true, numericality: { only_integer: true }
end
