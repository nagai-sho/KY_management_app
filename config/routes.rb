Rails.application.routes.draw do
  devise_for :users
  root to: 'sites#index'
  resources :sites do
    resources :projects do
      resources :ky_sheets
    end
    resources :locations
  end
end
