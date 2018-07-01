Rails.application.routes.draw do

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
    end
  end

  resources :templates, concerns: :paginatable
  resources :subscriptions, only: [:edit, :update]
  resources :events
  resources :components, concerns: :paginatable
  resources :situations, concerns: :paginatable, only: [:index, :edit, :update]
  resources :groups, concerns: :paginatable
  resource :config, only: [:edit, :update]

  devise_for :users, controllers: { confirmations: 'users/confirmations' }

  get 'home/index'
  root to: 'home#index'

end
