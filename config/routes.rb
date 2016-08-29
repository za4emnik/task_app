Rails.application.routes.draw do
  resources :projects do
    resources :tasks
  end
  get '/', to: 'front#index'
end
