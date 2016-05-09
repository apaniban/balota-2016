Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admin/sessions' }
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations',
                                    omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'home#index'

  resource :checklist, only: [:show, :edit, :update] do
    member do
      get 'download'
      get 'print'
    end
  end

  namespace :admin do
    root 'home#index'
    resources :presidents
    resources :vice_presidents
    resources :parties
    resources :party_lists
    resources :senators
  end
end
