Rails.application.routes.draw do
  devise_for :users 
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: "posts#index"
  get '/posts/about', to: 'posts#about'
  get '/posts/contacts', to: 'posts#contacts'
  get '/posts/my_work', to: 'posts#my_work'
  resources :categories
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
