Rails.application.routes.draw do

  root 'users#index'

  resources :users
  resource :project, except: :show
end
