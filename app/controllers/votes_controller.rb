class VotesController < ApplicationController

  def create
    @vote = current_user.votes.build(vote_params)
    @post = Post.find(params[:vote][:post_id])
    if @vote.save
      redirect_to :back, notice: "Thank you for voting."
      @post.increment!(:vote_count, by = 1)
    else
      redirect_to :back, alert: "Unable to vote, perhaps you already did."
    end  
  end

  private

    def vote_params
      params.require(:vote).permit(:user_id, :post_id)
    end
end
