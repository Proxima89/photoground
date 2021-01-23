Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" } # The devise rout designed to sign in only 1 admin 
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy' # The sign-out option completed with destroy method
  end

  root to: "posts#index" # Home page implemented with "root to:"
  get '/posts/about', to: 'posts#about' # route for about page 
  get '/posts/contacts', to: 'posts#contacts'# route for contact page
  get '/posts/my_work', to: 'posts#my_work'# route for album page called "my_work"
  resources :categories # All routed for categories controller brought together by the key word "resources"
  resources :posts # All routed for posts controller brought together by the key word "resources"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
