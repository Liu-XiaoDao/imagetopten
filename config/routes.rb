Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/index'

  get 'uploadimage/index'
  post "/auth/:provider/callback" => "sessions#create"

  get 'uploadimage/upima'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
