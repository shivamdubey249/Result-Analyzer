module Api
  class TestResultsController < ApplicationController
    def create
      TestResult.create!(
        student_name: params[:student_name],
        subject: params[:subject],
        marks: params[:marks],
        submitted_at: params[:timestamp]
      )

      head :created
    end
  end
end
