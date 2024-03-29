require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create(:user) }

  describe 'POST a new user' do
    it 'returns success for newly created user' do
      user_body = { name: 'John Doe',
                    email: 'john@gmail.com',
                    password: 'password' }

      post '/api/v1//users', params: user_body.to_json,
                             headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
      expect(response).to have_http_status(:success)
    end
  end
end
