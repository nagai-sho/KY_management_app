Rails.application.routes.draw do
  devise_for :users
  root to: 'sites#index'

  resources :introductions, only: :index

  resources :sites, shallow: true do
    resources :projects, shallow: true do
      resources :ky_sheets, shallow: true do
        member do
          get 'view_pdf'
        end
      end
      post 'ky_sheets/preview_pdf', to: 'ky_sheets#preview_pdf'
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
    resources :construction_contents,    shallow: true
  end
  
end
