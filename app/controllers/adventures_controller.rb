class AdventuresController < ApplicationController
  before_filter :authenticate_user!, except: [:home, :show, :about]

  def home
    @adventures = Adventure.all
    @top_stories = Post.where(type: "Story").order(:vote_count).first(2)
    @top_choices = Post.where(type: "Choice").order(:vote_count).first(2)
  end

  def index
  	@adventures = Adventure.scoped
  end

  def new
  	@adventure = Adventure.new(:parent_id => params[:parent_id])
  end

  def show
    @vote = Vote.new
    @post = Post.new
    @adventure = Adventure.find(params[:id])
    if @adventure.childless?
      flash[:notice] = "There are no more paths to this adventure, time to add your voice"
    end
  end

  def create
  	@user = current_user
    @adventure = current_user.adventures.build(adventure_params)
    if @adventure.save
      flash[:success] = "Adventure created!"
      redirect_to adventures_path
    else
      flash[:error] = "There was an error"
      redirect_to adventures_path
    end
  end

  def destroy
  	@adventure = Adventure.find(params[:id])
  	@adventure.destroy
  	redirect_to adventures_path
  end

  private

    def adventure_params
      params.require(:adventure).permit(:story, :choice, :parent_id, :user_id)
    end
end
