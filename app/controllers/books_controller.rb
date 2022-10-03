class BooksController < ApplicationController
  def new
    @book =Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to user_path(current_user.id)
      flash[:notice] = "You have created book successfully."
    else
      render :new
    end
  end

  def index
  end

  def show
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end
end
