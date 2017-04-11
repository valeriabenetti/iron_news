Rails.application.routes.draw do
  get 'stories/index'
  resources :stories
  root 'stories#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

end
