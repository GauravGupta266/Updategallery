Rails.application.routes.draw do
  # get 'home/index'
  devise_for :users
  # get 'albums/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  resources :albums
  delete "images/:id/purge", to: "albums#purge", as: "purge_image"
end
