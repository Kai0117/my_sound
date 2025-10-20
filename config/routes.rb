Rails.application.routes.draw do
  get 'songs/search'
  get 'songs/show'
  get 'songs/artist'
  get 'songs/album'
  get 'images/proxy'
  #get "sound_infos/sample_cover", to: "sound_infos#show_sample_cover"
  resources :sound_infos, only: [:new, :create, :show]
  
  get "/proxy_image", to: "images#proxy", as: :proxy_image

  resources :songs do
    collection do
      get "search"
    end
    member do
      get "artist"
      get "album"
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
end
