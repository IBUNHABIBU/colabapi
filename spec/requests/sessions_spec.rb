require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "POST /create" do
    context "with valid credentials" do
      let(:user) { create(:user) }
      let(:params) do
        {
          email: user.email,
          password: user.password
        }
      end

    end
    it "returns http success" do
      get "/sessions/create"
      expect(response).to have_http_status(:success)
    end
  end

end
