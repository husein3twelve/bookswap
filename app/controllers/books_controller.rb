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

	def new
		# creates new blog post in memory
		@book = Book.new
	end

	def create
		# saves to database
		@book = Book.new(book_params)

		if @book.save
			redirect_to @book
		else
			render :new, status: :unprocessable_entity
		end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to @book
		else
			render :edit, status: :unprocessable_entity
		end
	end

	# Book.new(params[:book]), instead due to security we have to build private method below and permit
	private
	def book_params
		params.require(:book).permit(:title, :author)
	end
end