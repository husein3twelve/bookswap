Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "/books/:id", to: "books#show", as: :book

  # Defines the root path route ("/")
  root "books#index"
end
