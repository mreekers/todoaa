class SessionsController < ApplicationController

	def index

		@author = Author.new

	end

	def create
  		@author = Author.find_by_username(params[:name])

  		if @author.authenticate(params[:password])
    		session[:autor_id] = @author.id
    		redirect_to root_path
  		else
    		flash[:error] = "Invalid username & password combination"
    		render :new
    	end
  	end
end

private
  def current_author
    #if @current_user is not defined set it equal to the result using the session hash given that exists
    @current_author ||= Author.find(session[:author_id]) if session[:author_id]
  end

  def author_signed_in?
    current_author.present?
  end

  def destroy
  session[:author_id] = nil
  redirect_to root_path
  end

  helper_method :current_author, :author_signed_in?