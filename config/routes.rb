Rails.application.routes.draw do
  resources :tweets
  resources :users, except: :show

  post '/users/login' => 'users#login'
  post '/follow/:id' => 'followers#do_follow'
  post '/unfollow/:id' => 'followers#do_unfollow'
  get 'user' => 'users#show'

  post '/users_search' => 'searches#users_search'
  post '/tweets_search' => 'searches#tweets_search'
  post '/total_search' => 'searches#combined_search'
  post '/forgot_password' => 'users#forgot_password'
  get '/tildetag' => 'tildetags#show'
  get '/tildetags' => 'tildetags#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
