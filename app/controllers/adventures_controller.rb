class AdventuresController < ApplicationController
  before_filter :authenticate_user!, except: [:home, :show, :about, :new]
  before_action :set_adventure, only: [:show, :edit, :destroy, :vote, :upvote, :downvote, :remove_upvote, :remove_downvote]

  def home
    @adventures = Adventure.all
    @top_submissions = Adventure.where(state: 'pending').order(vote_count: :desc)
    @popular_adventures = Adventure.where(state: 'popular').order(vote_count: :desc)
    @unpopulated_adventures = Adventure.where(state: 'accepting_submissions').order(vote_count: :desc)
  end

  def index
    @adventures = Adventure.scoped
  end

  def new
    @adventure = Adventure.new
    @parent = Adventure.find(params[:id])
    if @parent.accepting_submissions? || @parent.populated?
      @submissions = Adventure.find(params[:id]).children
    else
      redirect_to root_url
      flash[:error] = 'Sorry, that adventure is already populated.'
    end
  end

  def show
    @adventures = Adventure.find(params[:id]).children
  end

  def create
    @user = current_user
    @adventure = current_user.adventures.build(adventure_params)
    respond_to do |format|
      if @adventure.save
        if @adventure.only_child?
          @adventure.parent.populate
        end
        format.html { redirect_to @adventure.parent, notice: 'Adventure was successfully created.' }
        format.js   {}
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @upload = Upload.new
  end

  def destroy
    @adventure.parent.unpopulate if @adventure.only_child?
    @adventure.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.js   {}
    end
  end

  def upvote
    if request.post?
       @adventure.liked_by current_user
    elsif request.delete?
       @adventure.unliked_by current_user
    end
  end

  def downvote
    if request.post?
       @adventure.disliked_by current_user
    elsif request.delete?
       @adventure.undisliked_by current_user
    end
  end

  private

  def set_adventure
    @adventure = Adventure.find(params[:id])
  end

  def adventure_params
    params.require(:adventure).permit(:story, :choice, :parent_id, :user_id, :upload, :image)
  end

end
