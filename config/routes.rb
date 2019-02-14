Rails.application.routes.draw do
  root "toilets#index"

  resources :toilets, only: [:index, :update]
end
