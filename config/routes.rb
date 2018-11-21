Rails.application.routes.draw do
  devise_for :users
  resources :patients do
    resources :evolution_notes
  end

  resources :doctors
end
