Rails.application.routes.draw do
  
  resources :courses, only:[:show] do
    resources :exercises, only:[:new, :create, :destroy, :edit, :update]
  end
  
  resources :exercises, except:[:show, :index] do
    resources :results, only:[:new, :create]
    
  end
  resources :results, except:[:new, :create]
  


  get 'new-course', to:"courses#new"
  resources :courses, except:[:show, :new]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "courses#index"
end
