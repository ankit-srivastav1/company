Rails.application.routes.draw do
  devise_for :users
  resources :offices
  resources :tasks
  resources :projects do
    collection do
      post 'assign_project'
    end
    member do
      post 'assign_task'
    end
  end

  resources :user_tasks
  resources :project_users

  # root to: "prjects#assign_task"
  # get '/submit' to: '[ro]s#new'
end



# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
