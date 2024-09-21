Rails.application.routes.draw do
  root to: 'sites#index'
  resource :sites
end
