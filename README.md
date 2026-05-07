# README

# Result Analyzer application
The application processes student test results and performs End-of-Day (EOD) and monthly
calculations.

## Versions
* Ruby version- 3.3.0
* Rails version- 8.0.5
* MySQL Database- 0.5
* RSpecs for TDD (as required in task)

## Basic Flow
- Students take tests online.
- A third-party service (MSM) sends test results to our Rails application upon
submission.
- The application stores all incoming test results.
- Every day at 6:00 PM, the system performs scheduled processing:
	  - Calculates Daily Result Statistics
	  - Calculates Monthly Result Averages

## Implemented
- POST /api/test_results
- DailyStatisticsCalculator
- MonthlyResultAverageCalculator

## Reasonable Assumptions
- Monthly calculation starts from latest 5 daily statistics
- If cumulative result_count is below 200, older days are included
- If 200 is not reached, all available days are used
- Re-running services updates existing records instead of creating duplicates

## Run
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rspec
