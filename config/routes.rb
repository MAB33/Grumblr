Rails.application.routes.draw do

  resources :users

  root 'sessions#new'

  get 'sessions/new'
  get 'login' => 'sessions#new'
  post 'sessions' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


  # get 'sessions/new'

  # get 'users/index'

  # get 'users/new'

  # get 'users/edit'

  # get 'users/show'

  # get 'posts/edit'

  # get 'posts/new'

  # get 'posts/show'

  # get 'comments/edit'

  # get 'comments/new'

  # get 'comments/show'

end
