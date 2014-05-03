class AdventuresController < ApplicationController
	def home
	end

	def show
		@adventure = Adventure.find(params[:id])
	end

	def create
	end
end
