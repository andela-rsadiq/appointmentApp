Rails.application.routes.draw do
  root 'home#index'
  resources :patients do
    resources :appointments
  end
  resources :schedulers

  # get 'appointments/home'
  #
  get '/appointments' => 'appointments#index', as: :appointments
  #
  # get '/appointments/new' => 'appointments#new', as: :schedule
  #
  # post 'appointments/create'

  # get 'schedulers/index'
  #
  # get 'schedulers/new'
  #
  # get 'schedulers/create'

  # get 'patients/index'
  #
  # get 'patients/new'
  #
  # get 'patients/create'
end
