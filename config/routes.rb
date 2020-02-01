Rails.application.routes.draw do
  resources :exercise_to_trainingsplans
  resources :trainingsplan_to_users
  resources :trainingsplans
  resources :user_to_exercises
  resources :exercise_to_muscles

  resources :body_parts
  resources :muscles
  resources :sessions
  #resources :users
  get 'main/index'

  #sign_up 'users#new'

  post 'exercises/update_selected_exercise/:id', to: 'exercises#update_selected_exercise', format: 'js', as: :exercises_update_displayed_exercise

  get 'logout', to: 'sessions#destroy', as: :logout
  get 'login', to: 'sessions#new', as: :login
  get 'start', to: 'main#index', as: :start
  get 'sign_up', to: 'users#new', as: :sign_up

  get 'backend', to: 'backend#index', as: :backend

  get 'users/trainingsplans', to: 'users#trainingsplans', as: :user_trainingsplans
  post 'users/save_trainingsplan',to: 'users#save_trainingsplan', format: 'js',as: :user_save_trainingsplan

  get 'users/exercises', to: 'users#exercises', as: :user_exercises
  post 'users/save_exercise',to: 'users#save_exercise', format: 'js',as: :user_save_exercise

  post 'trainingsplans/load_trainingsplans',to: 'trainingsplans#load_trainingsplans', format: 'js',as: :trainingsplans_load_trainingsplans
  post 'trainingsplans/get_exercises',to: 'trainingsplans#get_exercises', format: 'js',as: :trainingsplans_get_exercises

  post 'main/muscle/:name',to: 'main#muscle', format: 'js',as: :main_muscle

  post 'main/body_part/:name', to: 'main#body_part', format: 'js', as: :main_body_part
  post 'main/search_string/:name', to: 'main#search_string', format: 'js', as: :main_search_string
  post 'main/exercise/:name', to: 'main#exercise', format: 'js', as: :main_exercise

  post 'trainingsplans/exercise/:name', to: 'trainingsplans#exercise', format: 'js', as: :trainingsplans_exercise

  get 'exercises/all', to: 'exercises#all',  as: :exercises_all

  post 'main/add_exercise/:exercise/trainingsplan/:trainingsplan', to: 'main#add_exercise', format: 'js', as: :main_add_exercise
  post 'main/remove_exercise/:ettp_id', to: 'main#remove_exercise', format: 'js', as: :main_remove_exercise
  post 'main/switch_exercise/:ettp_id_1/:ettp_id_2', to: 'main#switch_exercise', format: 'js', as: :main_switch_exercise

  post 'trainingsplans/remove_exercise/:ettp_id', to: 'trainingsplans#remove_exercise', format: 'js', as: :trainingsplans_remove_exercise
  post 'trainingsplans/switch_exercise/:ettp_id_1/:ettp_id_2', to: 'trainingsplans#switch_exercise', format: 'js', as: :trainingsplans_switch_exercise

  root 'main#index'

  resources :exercises

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
