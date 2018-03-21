Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end
  resources :users, :controller => "users"
  
  resources :contacts
  root 'contacts#index'
  match "*path", to: "contacts#catch_404", via: :all
end
