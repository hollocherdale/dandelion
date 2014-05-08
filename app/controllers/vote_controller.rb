class VoteController < ApplicationController
	def create
		@vote = Vote.new(vote_params)
		if @vote.save
			redirect_to :back, notice: "Thank you for voting."
		else
			redirect_to :back, alert: "Unable to vote, perhaps you already did."
		end	
	end

	private

		def vote_params
			params.require(:vote).permit(:user_id, :post_id)
		end
end
