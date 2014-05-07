class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:show]

  def show
  	@post = Post.new
  	@no_choice = false
    @adventure = Adventure.find(params[:id])
  end

  def create
  	@post = current_user.posts.build(post_params)
  	if @post.save
  	  flash[:success] = "Your post has been submitted"
  	  redirect_to post_path(@post[:id])
  	else
  	  flash[:error] = "There was an error"
  	  redirect_to post_path(@post[:id])
  	end
  end

  private

  	def post_params
  	  params.require(:post).permit(:story, :choice, :adventure_id, :user_id)
  	end

end
