Rails.application.routes.draw do
  devise_for :users
  root to: 'sites#index'

  resources :sites, shallow: true do
    resources :projects, shallow: true do
      resources :ky_sheets, shallow: true
    end
    resources :site_risk_predictions
    resources :site_risk_measures
  end

  resources :ky_sheets, only: [] do
    resources :locations,                shallow: true
    resources :actions,                  shallow: true
    resources :safety_risk_predictions,  shallow: true
    resources :safety_risk_measures,     shallow: true
    resources :quality_risk_predictions, shallow: true
    resources :quality_risk_measures,    shallow: true
    resources :outputs,                  shallow: true
  end
  
  # resources :sites do
  #   resources :projects do
  #     resources :ky_sheets do
  #       resources :locations
  #       resources :actions
  #       resources :safety_risk_predictions
  #       resources :safety_risk_measures
  #       resources :quality_risk_predictions
  #       resources :quality_risk_measures
  #       resources :outputs
  #     end
  #   end
  #   resources :site_risk_predictions
  #   resources :site_risk_measures
  # end
end
