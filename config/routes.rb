Rails.application.routes.draw do
  root to: 'sites#index'
  resources :sites do
    resources :projects do
      resources :ky_sheets
    end
  end
end
