Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  #using resources macro to define restful routes

  #nested route to associate assignment with instructor 
  resources :instructors do 
    resources :assignments, shallow: true
  end 

  resources :students
  resources :assignments
  resources :lessons

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'


  delete '/logout' => 'sessions#delete'

  get '/auth/facebook/callback' => 'sessions#create'

end
