Rails.application.routes.draw do
  devise_for :users
  resources :patients do
    resources :evolution_notes
  end
  root to: 'pages#index'
  resources :doctors
  resources :evolution_notes
end
