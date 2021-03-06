Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:show]

  resources :contacts do
    resources :favourites, :works, :friends, :familys
  end

  root to: "contacts#index"

  get 'user_contacts/:user_id' => 'contacts#user', as: :user_contacts
  get 'user_favourites/:user_id' => 'contacts#favourites', as: :user_favourites

  get 'users' => 'users#index'
  get 'users/:id', :to => 'users#show'
end
