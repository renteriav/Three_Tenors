ThreeTenors::Application.routes.draw do
  
  root to: "events#upcoming"
  
  resources :sound_clips
  
  get "audio_playlist", to: "sound_clips#playlist"

  devise_for :admins
  
  devise_scope :admin do
    unauthenticated :admin do
      get "admin", to: "devise/sessions#create"
    end
  end
  
  get "events/past", to: "events#past"
  
  resources :events
  
  get "concerts", to: "galleries#concerts"
  
end
