class TodosController < ApplicationController
	def index
		@author = Author.find(params[:id])
		@todos = @author.todos
	end

	def create
		@author = Author.find(params[:id])

		new_todo = params.require(:todo).permit(:description)
		new_todo[:completed] = false

		todo = Todo.create(new_todo)
		@author.todos << todo
		redirect_to "/authors/#{@author.id}/todos"
	end
end
