class WikisController < ApplicationController
    before_action :user_check, only: [:edit, :update, :new, :create, :destroy]
    
    def index
       @wikis = Wiki.all 
    end
    
    def show
        @wiki = Wiki.find(params[:id])
    end
    
    def new
        @wiki = Wiki.new
    end
    
    def create
        @wiki = Wiki.new(wiki_params)
        @wiki.user = current_user
        
        if @wiki.save
           flash[:notice] = "Wiki was saved."
           redirect_to @wiki
        else
            flash.now[:alert] = "There was an error saving the wiki. Please try again."
            render :new
        end
    end
    
    def edit
        @wiki = Wiki.find(params[:id])
    end
    
    def update
        @wiki = Wiki.find(params[:id])
        @wiki.assign_attributes(wiki_params)
        
        if @wiki.save
            flash[:notice] = "Wiki was updated."
            redirect_to @wiki
        else
            flash.now[:alert] = "There was an error saving the wiki. Please try again."
            render :edit
        end
    end
    
    def destroy
        @wiki = Wiki.find(params[:id])
     
        if @wiki.destroy
          flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
          redirect_to action: :index
        else
          flash.now[:alert] = "There was an error deleting the wiki."
          render :show
        end
    end
    
    
    private
    def wiki_params
        params.require(:wiki).permit(:title, :body)
    end
    
    def user_check
        @wiki = Wiki.find(params[:id])
        unless user_signed_in?
            flash[:notice] = "You must be logged in to do that."
            redirect_to @wiki
        end
    end
end
