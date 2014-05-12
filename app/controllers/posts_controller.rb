class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:show]

  def show
    @post = Post.find(params[:id])
    @adventure = Adventure.find(@post.adventure_id)
  end

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

  private
    def type
      params[:type] || "Post"
    end

  	def post_params
  	  params.require(type.underscore.to_sym).permit(:content, :adventure_id, :user_id, :type)
  	end
end
