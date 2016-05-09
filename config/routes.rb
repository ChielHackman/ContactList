Rails.application.routes.draw do
  devise_for :users
  resources :contacts do
    resources :favourites
  end
  root to: "contacts#index"

  get 'user_contacts/:user_id' => 'contacts#user', as: :user_contacts
  

end
