Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users

  get "/books/my_books", to: "books#my_books", as: :my_books_book
  resources :books

  # Defines the root path route ("/")
  root "books#index"

  # resources
  # get "/books", to: "books#index", as :books
  # get "/books/new", to: "books#new", as: :new_book
  # get "/books/:id", to: "books#show", as: :book
  # patch "/books/:id", to: "books#update"
  # delete "/books/:id", to: "books#destroy"
  # get "books/:id/edit", to: "books#edit", as: :edit_book
  # post "books/post", to: "books#create", as: :books

end
