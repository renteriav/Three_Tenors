ThreeTenors::Application.routes.draw do
  
  root to: "events#index"
  
  resources :events
  
  get "concerts", to: "galleries#concerts"
  
end
