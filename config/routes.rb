Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :houses, only: [:index, :create, :show]
  resources :teachers, only: [:index, :create, :destroy]
  resources :students, only: [:index, :create, :destroy]
  resources :appointments, only: [:index, :create, :destroy]
end
