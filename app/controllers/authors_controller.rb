class AuthorsController < ApplicationController
	def index
		@authors = Author.all
	end

	def show
		@author = Author.find(params[:id])
	end

	def create
		 @author = Author.new(author_params)

   		 if @author.save
        	redirect_to root_path
    	 else 
    
        	flash[:error] = @author.errors.full_messages.to_sentence 
        	render :new
        #new_author = params.require(:author).permit(:name)
        #Author.create(new_author)
        #redirect_to "/authors"
	end
end

private
  def author_params
    params.require(:author).permit(:name, :password, :password_confirmation)
  end
end
