Rails.application.routes.draw do
  get 'profiles/index'
  resources :studies
  resources :posts
  resources :surveys
  resources :answers
  resources :questions
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'welcome', to: 'welcome#index'
  get 'faq', to: 'faq#index'
  get 'studies', to: 'studies#index'
  get 'posts', to: 'posts#index'
  get 'profile', to: 'profiles#index'
  get 'profile/edit', to:'profiles#edit'
  put 'profile/edit', to:'profiles#update'
  get 'welcome/about', to:'welcome#about'
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
