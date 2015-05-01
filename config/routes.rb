Rails.application.routes.draw do

  devise_for :users

  get 'lists/index'

  
  resources :topics do
  	resources :comments
  end
  
  resources :lists


  put "/topics/:id/favorites" => "favorites#update", as: :favorite

  put "/articles/:id/commnets/:comments_id/report" => "reports#update", as: :reports

  root 'topics#index'
end
