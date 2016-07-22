Rails.application.routes.draw do
  resources :tweets
  resources :users

  post '/users/login' => 'users#login'
  post '/follow' => 'followers#do_follow'
  post '/unfollow' => 'followers#do_unfollow'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
