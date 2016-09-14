Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :tasks
  end
  get '/', to: 'front#index'
  get '/filter', to: 'front#filter'
  root 'front#index'
end
