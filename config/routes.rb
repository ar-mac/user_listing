Rails.application.routes.draw do

  root 'users#index'

  with_options except: :show do
    resources :users
    resource :project
  end
end
