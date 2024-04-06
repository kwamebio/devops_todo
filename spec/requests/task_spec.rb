require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  include FactoryBot::Syntax::Methods

  let(:task) { create(:task) }
  let(:user) { create(:user) }

  describe 'POST a new task' do
    it 'returns success for newly created task' do
      task_body = { title: 'Task 1',
                    body: 'Task 1 body',
                    user_id: user.id }

      post '/api/v1/tasks', params: task_body.to_json,
                            headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET all tasks' do
    it 'returns success for all tasks' do
      get '/api/v1/tasks'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET a single task' do
    it 'returns success for a single task' do
      task = create(:task, user:)

      get "/api/v1/tasks/#{task.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
