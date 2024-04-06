Rails.application.routes.draw do
  root to: 'application#health_check'

  namespace :api do
    namespace :v1 do
      resources :users
      resources :tasks
    end
  end
end
