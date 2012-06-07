Dansbeerlist::Application.routes.draw do
  
  resources :posts
  resources :comments
  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :blahs
  resources :eventspic
  resources :articlespic
  
  resources :microposts, :only => [:create, :destroy]
  resources :relationships, :only => [:create, :destroy]
  resources :videos
  resources :events
  resources :articles
  
  match 'gravatar' => 'blahs#gravatar' 
  match '/beerbasics'=> 'pages#beerbasics'
  match '/brewtube' => 'pages#brewtube'
  match '/contact' => 'pages#contact'
  match '/about' => 'pages#about'
  match '/beerbadges' => 'pages#beerbadges'
  match '/help' => 'pages#help'
  root :to => 'pages#home'
  match '/microposts/:id/destroy' => 'microposts#destroy', :as => :destroy_micropost
  match '/users/:id/destroy' => 'users#destroy', :as => :destroy_user
  match '/events/:id/destroy' => 'events#destroy', :as => :destroy_event
  match '/articles/:id/destroy' => 'articles#destroy', :as => :destroy_article
  
  match '/comments/:id/destroy' => 'comments#destroy', :as => :destroy_comment
  match '/posts/:id/destroy' => 'posts#destroy', :as => :destroy_post
  
  match 'event_registration' => 'participations#create',  :as => :register_for_event
  match 'participations/:event_id/destroy' => 'participations#destroy', :as => :destroy_participation


  match 'asdfasdfasdf' => 'participations#create', :as => :register_for_event
  match 'participations/:event_id/destroy' => 'participations#destroy', :as => :destroy_participation
  
  get "participations/new"

   get "participation/new"

   get "eventspic/edit"

   get "events/new"

   get "events/index"

   get "events/show"

   get "events/edit"
  
end
