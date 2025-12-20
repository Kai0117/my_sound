Rails.application.routes.draw do
  get 'static_pages/top'
  devise_for :users

  authenticated :user do
    root to: "sound_infos#new", as: :authenticated_root
  end

  unauthenticated do
    root to: "static_pages#top"
  end

  get "logout", to: "sessions#confirm"

  resources :sound_infos, only: [:new, :create, :show]

  resources :songs do
    collection { get :search }
    member { get :artist; get :album }
  end

  get "/proxy_image", to: "images#proxy"
end
