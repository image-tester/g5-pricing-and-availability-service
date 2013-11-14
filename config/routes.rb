G5PricingService::Application.routes.draw do

  root 'locations#index'

  resources :locations do
    resources :units
  end

end
