Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations:      'users/registrations',
    sessions:           'users/sessions',
    confirmations:      'users/confirmations',
    passwords:          'users/passwords',
    unlocks:            'users/unlocks',
  }
  root 'welcome#index'

  namespace :investor do
    get '/' => "main#index", as: 'root'
    resources :companies
    resources :campaigns
  end

  namespace :admin do
    get '/' => "main#index", as: 'root'
    resources :companies, only: [] do
      collection do
        get :pending
        get :approved
        get :rejected
      end

      member do
        get :moderate
        post :moderate, action: :submit
      end
    end
    resources :rewards, only: [] do
      collection do
        get :pending
        get :approved
        get :rejected
      end

      member do
        get :moderate
        post :moderate, action: :submit
      end
    end
  end

end
