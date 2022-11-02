Rails.application.routes.draw do
  resources :exercises, except:[:new, :create]
  get 'new-course', to:"courses#new"
  resources :courses, except:[:new, :show] 

  resources :courses, only:[:show] do
    resources :exercises, only:[:new, :create]
  end
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "courses#index"
end
