class PostsController < ApplicationController
	def show
		@adventure = Adventure.find(params[:id])
	end

end
