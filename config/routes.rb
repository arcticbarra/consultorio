Rails.application.routes.draw do
  devise_for :users
  resources :patients do
    resources :evolution_notes, only: [:index, :new, :create]
  end

  resources :doctors
  resources :evolution_notes, only: [:show, :edit, :update, :destroy]
end
