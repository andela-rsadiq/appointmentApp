Rails.application.routes.draw do
  get 'appointments/home'

  get 'appointments/index'

  get 'appointments/new'

  get 'appointments/create'

  get 'schedulers/index'

  get 'schedulers/new'

  get 'schedulers/create'

  get 'patients/index'

  get 'patients/new'

  get 'patients/create'

  root 'home#index'
end
