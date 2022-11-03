Rails.application.routes.draw do
  
  resources :courses, only:[:show] do
    resources :exercises
  end
  resources :courses, except:[:show]

  get 'new-course', to:"courses#new"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "courses#index"
end
