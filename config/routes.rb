Rails.application.routes.draw do
  root "polls#index"
  
  resources :polls, param: :share_code, only: [:index, :new, :create, :show] do
    member do
      get 'results'
      post 'vote'
      get 'qr_code'
      patch 'close'
    end
  end
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check
end
