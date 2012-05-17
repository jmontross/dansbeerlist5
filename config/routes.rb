Dansbeerlist::Application.routes.draw do
  
  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :blahs
  
  resources :microposts, :only => [:create, :destroy]
  resources :relationships, :only => [:create, :destroy]
  match 'gravatar' => 'blahs#gravatar' 
  match '/beerbasics'=> 'pages#beerbasics'
  match '/brewtube' => 'pages#brewtube'
  match '/contact' => 'pages#contact'
  match '/about' => 'pages#about'
  match '/sponsors' => 'pages#sponsors'
  match '/help' => 'pages#help'
  root :to => 'pages#home'
  match '/microposts/:id/destroy' => 'microposts#destroy', :as => :destroy_micropost
  match '/users/:id/destroy' => 'users#destroy', :as => :destroy_user

  
end
