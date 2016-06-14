class BooksController < ApplicationController
  before_filter :authenticate
  def index
    if params[:search]
      @books = Book.search(params[:search]).page(params[:page]).per(2)
    else
      @books = Book.descending.page(params[:page]).per(6)
    end
  end

  def new
    @book = Book.new
  end

  def show
     @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
      # redirect_to book_path(@book)
    else
      render action: :new
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    if @book.destroyed?
      redirect_to action: :index
    else
      render @book.errors
    end
  end

   private

  def book_params
    params.require(:book).permit(:genre, :attachment, :title, :page_count)
  end
end