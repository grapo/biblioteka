class AuthorsController < ApplicationController
    before_filter :authenticate_user!
    
    def index
        @q = Author.search(params[:q])
        @authors = @q.result(:distinct => true)
                     .paginate(:page => params[:page])
    end

    def new
        @author = Author.new
    end

    def edit
        @author = Author.find_by_id(params[:id])
    end

    def create
        @author = Author.new(params[:author])
        if @author.save
            redirect_to authors_path
        else
            render :action => "new"
        end
    end

    def update
        @author = Author.find(params[:id])
        @author.update_attributes(params[:author])
        if @author.save
            redirect_to authors_path
        else
            render :action => "edit"
        end

    end

    def destroy
        author = Author.find(params[:id])
        author.delete
        redirect_to authors_path
    end
end
