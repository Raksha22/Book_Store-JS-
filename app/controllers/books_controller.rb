class BooksController < ApplicationController

  def index
      @books = Book.all
      @book = Book.new
      # render json: @books
  end


  def search
      @book = Book.new
   respond_to do |format|
      @search_results_books =  Book.joins(:taggings).where('tag_name like :query OR name like :query', query: "%#{params[:search]}%").uniq
      format.js {render partial: 'search'}
   end
  end


  def show
      @book = Book.find(params[:id])
  end

  def edit
      @book = Book.find(params[:id])

  end

  
  def new
    @book = Book.new
    @book.taggings.build
  end

  def create
    @book = Book.create(book_params)

    respond_to do |format|
      if @book.save
        format.js     
      else
        format.js     
      end
    end
  end

  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update(book_params)
        format.js   
      else
        format.js
      end
    end
  end

  def destroy
    @book = Book.find(params[:id])

    @book.destroy
 
    respond_to do |format|
      format.js
    end
  end

  private

      def book_params
      params.require(:book).permit(:id, :name, :description, taggings_attributes: [:id, :tag_name])
    end
end
