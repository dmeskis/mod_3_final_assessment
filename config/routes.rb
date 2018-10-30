Rails.application.routes.draw do
  root "welcome#index"

  # API
  namespace :api do
    namespace :v1 do
      resources :games, only: [:show]
    end
  end

  get '/examples', to: "welcome#show"
end
