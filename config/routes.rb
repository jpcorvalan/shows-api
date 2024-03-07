Rails.application.routes.draw do
#      /path         controller#metodo
  get '/health', to: 'health#health'

  # resources :characters, only: %i[ show update destroy ] do
  #   get '/' => 'characters#find_by_name', on: :collection
  # end
  resources :shows
  resources :characters

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
