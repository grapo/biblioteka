class AuthorsController < ApplicationController
    def index
        @authors = Author.all
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
