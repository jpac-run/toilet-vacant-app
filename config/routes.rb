Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "toilets#index"

  patch "get_in/:id", controller: "toilets", action: "get_in", as: :get_in_toilet
  patch "get_out/:id", controller: "toilets", action: "get_out", as: :get_out_toilet
end
