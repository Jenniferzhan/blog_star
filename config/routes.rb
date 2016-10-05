Rails.application.routes.draw do
  get 'users/new'
  post 'users/create'

  mount Ckeditor::Engine => '/ckeditor'

  resources :categories do
    resources :articles do
      resources :comments
    end
  end

  get 'articles' =>'articles#index'
  get 'static_pages/home'
  get 'static_pages/about'

  get 'sessions/new'
  post 'sessions/create'
  delete 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
