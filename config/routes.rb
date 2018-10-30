Rails.application.routes.draw do
  root "welcome#index"

  get '/examples', to: "welcome#show"
end
