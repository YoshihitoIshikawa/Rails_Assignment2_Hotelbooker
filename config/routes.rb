Rails.application.routes.draw do
  root to: "top#index"

  get 'searches/result'
  get 'profile/edit'
  get 'users/account'
  get 'users/profile'
  get 'top/index'
  get 'user', to: 'profile#edit'
  patch 'user', to: 'profile#update'

  devise_for :users, controllers: { registrations: 'users/registrations',sessions: 'users/sessions' }
  resources :rooms, :except => [:edit, :update, :destroy]
  resources :reservations, :only => [:index, :create] do
    collection do
      post :confirm
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
