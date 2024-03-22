Rails.application.routes.draw do
  root to: "application#health_check"

  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
end
