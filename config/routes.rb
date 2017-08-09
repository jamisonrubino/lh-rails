Rails.application.routes.draw do
  resources :wikis
  devise_for :users
  get 'about' => 'welcome#about'
  resources :charges, only: [:new, :create]
  get 'charges/downgrade' => 'charges#downgrade', :as => :downgrade
  root 'welcome#index'  
end
