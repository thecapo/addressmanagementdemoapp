Rails.application.routes.draw do
  devise_for :users
  resources :contacts
  root 'contacts#index'
  match "*path", to: "contacts#catch_404", via: :all
end
