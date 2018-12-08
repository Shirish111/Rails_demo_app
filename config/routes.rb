Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login', to: "user#login"
  post '/login', to: "user#login"
  get '/signup', to: "user#create"
  post '/signup', to: "user#create"
  get '/home', to: "user#home"
  get '/startpage', to: "user#startpage"
  get '/logout', to: 'user#logout'
  get '/profile', to: 'user#profile'
  get '/following', to: 'follow#following'
  post '/search', to: 'follow#search'
  get '/search', to: 'follow#search'
  post '/follow_user', to: 'follow#follow'
  post '/new_post', to: 'post#new_post'
  post '/comment', to: 'post#comment'
  post '/like', to: 'post#like'
  root "user#startpage"
end
