require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST #create' do
    context 'with valid credentials' do
      let(:user) { create(:user) }

      it 'login the user' do
        post :create, params: { session: { email: user.email, password: user.password } }
        # expect(response).to have_http_status(:created)
        expect(session[:user_id]).to eq(user.id)
      end
    end
  end
end
