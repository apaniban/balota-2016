Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  namespace :admin do
    root 'parties#index'
    resources :parties
  end
end
