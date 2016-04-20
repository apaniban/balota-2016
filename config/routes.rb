Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admin/sessions' }
  devise_for :users, controllers: { sessions: 'sessions' }

  root 'home#index'

  resources :checklists

  namespace :admin do
    root 'parties#index'
    resources :presidents
    resources :vice_presidents
    resources :parties
    resources :party_lists
    resources :senators
  end
end
