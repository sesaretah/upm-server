Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  api_version(:module => "V1", :path => {:value => "v1"}) do

    get '/profiles/search', to: 'profiles#search'
    put '/profiles', to: 'profiles#update'
    get '/profiles/my', to: 'profiles#my'

    resources :profiles
    resources :channels
    resources :posts
    resources :roles
    resources :shares
    resources :uploads
    resources :auxiliary_tables
    resources :auxiliary_records
    resources :interactions
    resources :users

    post '/users/login', to: 'users#login'
    post '/users/sign_up', to: 'users#sign_up'

  end
end
