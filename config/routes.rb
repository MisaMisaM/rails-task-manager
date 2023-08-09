Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/tasks', to: 'tasks#index', as: :tasks

  get '/tasks/new', to: 'tasks#new', as: :new_task
  post '/tasks', to: 'tasks#create' # already has a prefix

  #show
  get '/tasks/:id', to: 'tasks#show', as: :task

  #update
  get '/tasks/:id/edit', to: 'tasks#edit', as: :edit_task
  patch '/tasks/:id', to: 'tasks#update' # already has a prefix

  delete '/tasks/:id', to: 'tasks#destroy' # already has a prefix
end
