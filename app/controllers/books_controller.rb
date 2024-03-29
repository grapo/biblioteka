class BooksController < ApplicationController

    before_filter :authenticate_user!

    def index
        @q = Book.search(params[:q])
        @books = @q.result(:distinct => true)
                    .paginate(:page => params[:page])
    end

    def show
        @book = Book.find_by_id(params[:id])
    end 

    def new
        @book = Book.new
        @authors = []
    end

    def edit
        @book = Book.find_by_id(params[:id])
        @authors = @book.authors
    end

    def create
        @book = Book.new(params[:book])
        @book.authors = Author.find(params[:author_ids]) if params[:author_ids]
        if @book.save
            redirect_to books_path
        else
            @authors = params[:author_ids] ? Author.find(params[:author_ids]) :  []
            render :action => "new"
        end
    end

    def update
        @book = Book.find(params[:id])
        @book.update_attributes(params[:book])
        if @book.save
            @book.authors = Author.find(params[:author_ids]) if params[:author_ids]
            redirect_to books_path
        else
            @authors = Author.find(params[:author_ids]) if params[:author_ids]
            render :action => "edit"
        end
    end
    def destroy
        @book = Book.find(params[:id])
        @book.delete
        redirect_to books_path
    end
end
