require "rails_helper"

RSpec.describe "POST /api/test_results", type: :request do
  let(:payload) do
    {
      student_name: "Jack",
      subject: "Math",
      marks: 82,
      timestamp: "2026-05-07T10:30:00Z"
    }
  end

  it "creates a test result" do
    expect {
      post "/api/test_results", params: payload
    }.to change(TestResult, :count).by(1)

    expect(response).to have_http_status(:created)
  end
end
