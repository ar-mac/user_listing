Rails.application.routes.draw do

  root 'users#index'

  with_options except: :show do
    resources :users
    resources :projects, except: :index
  end
end
