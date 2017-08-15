Rails.application.routes.draw do
  resources :collaborators
  resources :wikis
  devise_for :users
  get 'about' => 'welcome#about'
  resources :charges, only: [:new, :create]
  get 'charges/downgrade' => 'charges#downgrade', :as => :downgrade
  # get 'collaborators/add_collaborator' => 'collaborator#add_collaborator', :as => :add_collaborator
  root 'welcome#index'  
end
