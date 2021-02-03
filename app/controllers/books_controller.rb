class BooksController < ApplicationController
 

  layout false

  @message = ""

  def index
    @books = Book.order('updated_at ASC')
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(
      :title => params[:book][:title],
      :author => params[:book][:author],
      :genre => params[:book][:genre],
      :price => params[:book][:price],
      :published => params[:book][:published]
    )

    if @book.save 
      flash[:notice] = "Successfully Created the Book."
      redirect_to (books_path)
    else
      render('new')
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(
      :title => params[:book][:title],
      :author => params[:book][:author],
      :genre => params[:book][:genre],
      :price => params[:book][:price],
      :published => params[:book][:published]
      )
      
      flash[:notice] = "Successfully Updated the Book."
      redirect_to (books_path)
    else
      render('edit')
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Successfully Deleted the Book."
    redirect_to (books_path)
  end
end
