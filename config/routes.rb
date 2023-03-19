Rails.application.routes.draw do
  resources :signups, only: [:create]
  resources :activities, only: %i[index destroy]
  resources :campers, only: %i[index show create]
end
