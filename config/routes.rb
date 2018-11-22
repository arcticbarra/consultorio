Rails.application.routes.draw do
  devise_for :users
  resources :patients do
    resources :evolution_notes
  end
  resources :doctors
  resources :evolution_notes
  authenticated :user do
    root to: 'patients#index'
  end
  unauthenticated do
    root to: 'pages#index'
  end
end
