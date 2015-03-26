SampleApp::Application.routes.draw do
  resources :users
  resources :users do
    member do
      get :following, :followers, :send_email
      post :create_email
    end
  end

  resources :users do
    collection do
      get :tigers
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:show, :new, :create, :destroy, :edit, :update]
  resources :microposts do
    resources :comments
  end
  resources :relationships, only: [:create, :destroy]

  resources :password_resets do
    get 'new', on: :collection
  end
  
  root to: 'static_pages#home'
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/help', to: 'static_pages#help', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/messages', to: 'users#messages', via: 'get'

end
