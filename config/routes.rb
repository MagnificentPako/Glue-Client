Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"

  get "/upload" => "upload#index"
  post "/upload" => "upload#post"

  get "/login" => "users#new"
  post "/login" => "users#login"

  get "/register" => "users#create"
  post "/register" => "users#register" 

  get "/logout" => "users#logout"

  get "/drops" => "drops#index"
  get "/drops/search/:query" => "drops#search"
  post "/drops" => "drops#vanity" #used to redirect user to readable url

  get "/drops/new" => "upload#index"

  get "/drop/:name" => "drops#show"
  get "/drop/:name/:version" => "drops#detail"

end
