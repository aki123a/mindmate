Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do
    member do
      get :compatibility_index
    end
  end
end
