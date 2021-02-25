Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :users
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users', to: 'users#index', as: 'users'
  post 'users', to: 'users#create'
  patch 'users/:id', to: 'users#update'
  put 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#destroy'
  # get 'users/new', to:'users#new', as: 'new_user'
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_user'

  # resources :artworks
  get 'artworks/:id', to: 'artworks#show', as: 'artwork'
  get 'artworks', to: 'artworks#index', as: 'artworks'
  post 'artworks', to: 'artworks#create'
  patch 'artworks/:id', to: 'artworks#update'
  put 'artworks/:id', to: 'artworks#update'
  delete 'artworks/:id', to: 'artworks#destroy'

  # get 'artworks/new', to:'artworks#new', as: 'new_artwork'
  # get 'artworks/:id/edit', to: 'artworks#edit', as: 'edit_artwork'


  resources :artwork_shares, only: [:create, :destroy]

  # get 'artwork_shares/:id', to: 'artwork_shares#show', as: 'artwork_share'
  # get 'artwork_shares', to: 'artwork_shares#index', as: 'artwork_shares'
  # post 'artwork_shares', to: 'artwork_shares#create'
  # patch 'artwork_shares/:id', to: 'artwork_shares#update'
  # put 'artwork_shares/:id', to: 'artwork_shares#update'
  # delete 'artwork_shares/:id', to: 'artwork_shares#destroy'
  # get 'artwork_shares/new', to:'artwork_shares#new', as: 'new_artwork_shares'
  # get 'artwork_shares/:id/edit', to: 'artwork_shares#edit', as: 'edit_artwork_shares'

end
