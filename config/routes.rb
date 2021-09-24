Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/houses', to: 'houses#index'
  get '/houses/:id', to: 'houses#show', id: /\d+/
  root to 'houses#index'
end
