Rails.application.routes.draw do
  root "posts#index"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :posts do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: :show do
    member do
      get :likes
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
