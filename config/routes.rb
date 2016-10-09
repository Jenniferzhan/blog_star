Rails.application.routes.draw do
  resources :posts
  get 'users/new'
  post 'users/create'
  root 'articles#index'
  mount Ckeditor::Engine => '/ckeditor'
 # resources :posts,only: [:index,:show]
  resources :categories, :only=>[:show] 
  resources :articles, :only=>[:show,:index,:edit,:update] do
    resources :comments, :only=>[:create]
  end
  get 'articles' =>'articles#index'
  get 'static_pages/home'
  get 'static_pages/about'
  namespace :admin do 
    resources :categories
    resources :articles  
    resources :comments,only: [:destroy,:index]
    resources :posts
    resources :sessions, :only=>[:new, :create, :destroy]  
  end
end
