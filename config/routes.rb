Rails.application.routes.draw do

  resources :uploadimage
  resources :admin
  post '/admin/title' => 'admin#title'
  post '/admin/describe' => 'admin#describe'

  post '/admin/vote' => 'admin#vote'
  
  get '/signin' => 'sessions#new'
  get 'sessions/create'
  delete '/signout' => 'sessions#destroy'
  post '/uploadimage/upima' => 'uploadimage#upima'

  get 'home/index'
  get 'home/show'
  get 'home/showimg'
  get 'home/showfour'

  post "/auth/:provider/callback" => "sessions#create"

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
