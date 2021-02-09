class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @books = Book.all
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = 'You have created book successfully.'
      redirect_to book_path(@book)
    else
      render :index
    end
  end
  
  def show
    @book = Book.new
    @book_detail = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
    unless @book.user.id == current_user.id then
      redirect_to books_path
    end
  end
  
  def update
    
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  
  private
  
    def book_params
      params.require(:book).permit(:title, :body)
    end

end

