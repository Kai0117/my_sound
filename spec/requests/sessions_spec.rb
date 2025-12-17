require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /confirm" do
    it "returns http success" do
      get "/sessions/confirm"
      expect(response).to have_http_status(:success)
    end
  end

end
