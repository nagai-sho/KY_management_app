Rails.application.routes.draw do
  devise_for :users
  root to: 'sites#index'

  resources :sites, shallow: true do
    resources :projects, shallow: true do
      resources :ky_sheets, shallow: true
    end
    member do
      get 'item_list'
    end
    resources :site_risk_predictions,    shallow: true
    resources :site_risk_measures,       shallow: true
    resources :safety_risk_predictions,  shallow: true
    resources :safety_risk_measures,     shallow: true
    resources :quality_risk_predictions, shallow: true
    resources :quality_risk_measures,    shallow: true
    resources :locations,                shallow: true
    resources :actions,                  shallow: true
  end

  resources :ky_sheets, only: [] do
    resources :outputs,                  shallow: true
  end
  
end
