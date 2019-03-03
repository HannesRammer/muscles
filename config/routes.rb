Rails.application.routes.draw do
  resources :user_to_exercises
  resources :exercise_to_muscles
  resources :exercises
  resources :body_parts
  resources :muscles
  resources :sessions
  resources :users
  get 'main/index'


  #sign_up 'users#new'

  get 'logout', to: 'sessions#destroy', as: :logout
  get 'login', to: 'sessions#new', as: :login
  get 'start', to: 'main#index', as: :start
  get 'sign_up', to: 'users#new', as: :sign_up

  post 'main/muscle/:name',to: 'main#muscle', format: 'js',as: :main_muscle

  post 'main/body_part/:name', to: 'main#body_part', format: 'js', as: :main_body_part
  post 'main/search_string/:name', to: 'main#search_string', format: 'js', as: :main_search_string
  post 'main/exercise/:name', to: 'main#exercise', format: 'js', as: :main_exercise

  root 'main#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
