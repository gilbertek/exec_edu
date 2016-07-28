Rails.application.routes.draw do
  get     '/signup',    to: 'users#new'

  get     '/login',     to: 'sessions#new'
  post    '/login',     to: 'sessions#create'
  delete  '/logout',    to: 'sessions#destroy'
  get     'welcome/index'
  root    'welcome#index'

  resources :users, only: %w(create new)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
