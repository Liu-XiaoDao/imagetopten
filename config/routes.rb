Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'
  post 'uploadimage/upima'
  get 'home/index'
  resources :uploadimage

  post "/auth/:provider/callback" => "sessions#create"

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
