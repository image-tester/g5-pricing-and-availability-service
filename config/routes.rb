G5PricingService::Application.routes.draw do

  root 'locations#index'

  resources :locations do
    resources :floor_plans
  end

  get '/locations/:id/widget', to: 'locations#widget'

  post "update" => "webhooks#update"
end
