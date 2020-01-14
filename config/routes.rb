Rails.application.routes.draw do
  resources :exercise_to_trainingsplans
  resources :trainingsplan_to_users
  resources :trainingsplans
  resources :user_to_exercises
  resources :exercise_to_muscles

  resources :body_parts
  resources :muscles
  resources :sessions
  resources :users
  get 'main/index'
  #resources :exercises

  #sign_up 'users#new'

  post 'exercises/update_selected_exercise/:id', to: 'exercises#update_selected_exercise', format: 'js', as: :exercises_update_displayed_exercise

  get 'logout', to: 'sessions#destroy', as: :logout
  get 'login', to: 'sessions#new', as: :login
  get 'start', to: 'main#index', as: :start
  get 'sign_up', to: 'users#new', as: :sign_up

  get 'backend', to: 'backend#index', as: :backend

  post 'main/muscle/:name',to: 'main#muscle', format: 'js',as: :main_muscle

  post 'main/body_part/:name', to: 'main#body_part', format: 'js', as: :main_body_part
  post 'main/search_string/:name', to: 'main#search_string', format: 'js', as: :main_search_string
  post 'main/exercise/:name', to: 'main#exercise', format: 'js', as: :main_exercise

  get 'exercises/all', to: 'exercises#all', format: 'js', as: :exercises_all

  post 'main/add_exercise/:exercise', to: 'main#add_exercise', format: 'js', as: :main_add_exercise
  post 'main/remove_exercise/:ute_id', to: 'main#remove_exercise', format: 'js', as: :main_remove_exercise
  post 'main/switch_exercise/:ute_id_1/:ute_id_2', to: 'main#switch_exercise', format: 'js', as: :main_switch_exercise

  root 'main#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
