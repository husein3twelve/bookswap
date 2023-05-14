class BooksController < ApplicationController
	def index
		@books = Book.all
	end

	def show
		@book = Book.find(params[:id])
	# error handling when id not found
	rescue ActiveRecord::RecordNotFound
		redirect_to root_path
	end
end