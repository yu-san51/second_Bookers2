class BooksController < ApplicationController
	def index
		@books = Book.all
	end

	def show
		@book = Book.find(params[:id])
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to book_path(@book.id)
		else
			@book = Book.find(params[:id])
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
