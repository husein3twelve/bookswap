class BooksController < ApplicationController
	
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_book, only: [:show, :edit, :update, :destroy]

	def index
		@books = Book.all
	end

	def show
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
	end

	def update
		if @book.update(book_params)
			redirect_to @book
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@book.destroy
		redirect_to root_path
	end

	# Book.new(params[:book]), instead due to security we have to build private method below and permit
	private
	
	def book_params
		params.require(:book).permit(:title, :author)
	end

	def set_book
		@book = Book.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		redirect_to root_path
	end
end