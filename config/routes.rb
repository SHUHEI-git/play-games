Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root "posts#index"
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
    end
  end
end
