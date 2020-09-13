Rails.application.routes.draw do
  
  get 'buyers/index'
  get 'buyers/create'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'shipping_infos', to: 'users/registrations#shipping_info'
    post 'shipping_infos', to: 'users/registrations#create_shipping_info'
  end

  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end

  root 'items#index'
    resources :users, only: [:index, :new, :edit]
    resources :items, only: [:index, :new, :show] do
      resources :comments, only: [:create ,:update, :destroy]
    end
end