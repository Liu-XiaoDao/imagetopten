Rails.application.routes.draw do


  get '/uploadimage/anonymousunew' => 'uploadimage#anonymousunew'

  # get '/admin/favorite' => 'admin#favorite'
  # resources :uploadimage
  # resources :admin
  resources :supermans

  # post '/admin/title' => 'admin#title'
  # post '/admin/describe' => 'admin#describe'
  post '/admin/vote' => 'admin#vote'

  # get '/admin/favorite' => 'admin#favorite'

  # get '/signin' => 'sessions#new'
  # post '/signin' => 'sessions#create'


  # delete '/signout' => 'sessions#destroy'


  post '/uploadimage/upima' => 'uploadimage#upima'


  # get 'home/index'
  # get 'home/show'
  # get 'home/showimg'
  # get 'home/showfour'
  # get 'home/showfive'
  get 'home/topten'

  get 'home/showsix'


  # post "/auth/:provider/callback" => "sessions#create"

  root 'home#showfive'

end
