Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :show, :index] do
    resource :posts, only: [:edit, :update]
  end
  resource :session, only: [:new, :create, :destroy]

  resources :subs, only: [:new, :create, :show, :index, :update, :edit]
  
  resources :posts, only: [:new, :create, :show, :destroy]
end
