Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/users', to: 'users#index'
  post '/login', to: 'users#process_login'
  post '/users/create', to: 'users#create'
  post '/users/friend', to: 'users#create_friendship'

  get '/tournaments', to: 'tournaments#index'
  post '/tournament/:id', to: 'tournaments#show'
  post '/tournaments/create', to: 'tournaments#create'

  get '/competitions', to: 'competitions#index'
  post '/competitions/associate', to: 'competitions#create'
  post '/competitions/delete', to: 'competitions#delete'

  get '/friends', to: 'relationship#index'
  post '/relationship/friend', to: 'relationships#create'
  post '/relationship/unfriend', to: 'relationship#delete'

  get '/tasks', to: 'tasks#index'
  post '/tasks/create', to: 'tasks#create'
  post '/tasks/delete', to: 'tasks#delete'

  post '/completedtasks/log', to: 'completed_tasks#log_task'
end
