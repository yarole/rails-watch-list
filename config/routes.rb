Rails.application.routes.draw do
  # get 'bookmarks/new'
  # get 'bookmarks/create'
  # get 'bookmarks/destroy'
  # get 'list/index'
  # get 'list/show'
  # get 'list/new'
  # get 'list/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "lists#index"
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
    # resources :reviews, only: :create
  end
  resources :bookmarks, only: [:destroy]
  # resources :reviews, only: :destroy
end
