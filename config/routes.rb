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
    resources :companies, only: [:index, :show, :new, :create, :destroy]
  end

  namespace :admin do
    get '/' => "main#index", as: 'root'
  end

end
