class VotesController < ApplicationController

  def create
    @vote = current_user.votes.build(vote_params)
    @adventure = Adventure.find(params[:vote][:adventure_id])
    if @vote.save
      redirect_to :back, notice: "Thank you for voting."
      @adventure.increment!(:vote_count, by = 1)
    else
      redirect_to :back, alert: "Unable to vote, perhaps you already did."
    end  
  end

  private

    def vote_params
      params.require(:vote).permit(:user_id, :adventure_id)
    end
end
