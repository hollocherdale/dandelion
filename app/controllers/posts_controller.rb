class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:show]

  # def show
  # 	@post = Post.new
  # 	@no_choice = false
  #   @adventure = Adventure.find(params[:id])
  # end

  def create
  	@post = current_user.posts.build(post_params)
  	if @post.save
  	  flash[:success] = "Your post has been submitted"
  	  redirect_to :back
  	else
  	  flash[:error] = "There was an error"
  	  redirect_to :back
  	end
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
  	redirect_to :back
  end

  
  def vote
    vote = current_user.post_votes.new(value: params[:value], post_id: params[:id])
    if vote.save
      redirect_to :back, notice: "Thank you for voting."
    else
      redirect_to :back, alert: "Unable to vote, perhaps you already did."
    end
  end

  private

  	def post_params
  	  params.require(:post).permit(:story, :choice, :adventure_id, :user_id)
  	end

end
