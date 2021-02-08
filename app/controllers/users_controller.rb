class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.all
  end
  
  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id then
      redirect_to current_user
    end
  end

end
