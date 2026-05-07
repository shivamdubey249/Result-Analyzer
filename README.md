# README

# Result Analyzer application.
The application processes student test results and performs End-of-Day (EOD) and monthly
calculations.

# Versions
* Ruby version- 3.3.0
* Rails version- 8.0.5
* MySQL Database- 0.5
* RSpecs for TDD (as required in task)

# Basic Flow
- Students take tests online.
- A third-party service (MSM) sends test results to our Rails application upon
submission.
- The application stores all incoming test results.
- Every day at 6:00 PM, the system performs scheduled processing:
	  - Calculates Daily Result Statistics
	  - Calculates Monthly Result Averages

