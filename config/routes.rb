Rails.application.routes.draw do
  root "customers#index"
  resources :reminders do
    member do
      get :close
      get :print
    end
  end
  resources :reminder_types
  resources :customers do
    member do
      get :print
    end
    resources :reminders do
      member do
        get :close
      end
    end
  end
  devise_for :users
end
