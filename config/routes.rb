Rails.application.routes.draw do
  root 'home#index'

  resources :artists do
    resources :albums, except: [:index, :show]
      resources :songs, except: [:index, :show]
  end

end
