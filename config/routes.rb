G5PricingService::Application.routes.draw do

  root 'locations#index'
  resources :locations

end
