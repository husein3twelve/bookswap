Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "/books/new", to: "books#new", as: :new_book
  get "/books/:id", to: "books#show", as: :book
  post "books/post", to: "books#create", as: :books

  # Defines the root path route ("/")
  root "books#index"
end
