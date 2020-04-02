class BooksController < ApplicationController
	def index
		@books = Book.all
		@user = current_user
		@createbook = Book.new
	end

	def show
		@book = Book.find(params[:id])
		@user = @book.user
		@createbook = Book.new
	end

	def create
		@createbook = Book.new(book_params)
		@createbook.user_id = current_user.id
		if @createbook.save
			redirect_to book_path(@createbook.id)
		else
			@books = Book.all
			@user = current_user
			render :index
		end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		book = Book.find(params[:id])
		if book.update(book_params)
			redirect_to book_path(book.id)
		else
			@book = book
			render :edit
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end




	private
	def  book_params
		params.require(:book).permit(:title, :body)
	end
end
