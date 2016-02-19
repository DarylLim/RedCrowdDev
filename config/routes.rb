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
  end
end
