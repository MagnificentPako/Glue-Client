Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "upload#index"
  post "/upload" => "upload#post", as: :upload

end