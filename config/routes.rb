Rails.application.routes.draw do
  get 'home/index'

  get 'uploadimage/index'

  get 'uploadimage/upima'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
