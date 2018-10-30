Rails.application.routes.draw do
  root "welcome#index"

  # API
  namespace :api do
    namespace :v1 do
      resources :games, only: [:show]
    end
  end
  post 'api/v1/games/:id/plays', to: 'api/v1/games/plays#create'
  get '/examples', to: "welcome#show"
end
