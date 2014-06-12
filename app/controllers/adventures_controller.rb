class AdventuresController < ApplicationController
  before_filter :authenticate_user!, except: [:home, :show, :about, :new]
  before_action :set_adventure, only: [:show, :edit, :destroy, :upvote, :downvote, :remove_upvote, :remove_downvote]

  def home
    @adventures = Adventure.all
    @top_submissions = Adventure.all.where(state: "pending").order(vote_count: :desc)
    @popular_adventures = Adventure.where(state: "popular").order(vote_count: :desc)
    @unpopulated_adventures = Adventure.where(state: "accepting_submissions").order(vote_count: :desc)
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
      flash[:error] = "Sorry, that adventure is already populated."
    end
  end

  def show
    @submissions = Adventure.find(params[:id]).children
  end

  def create
    @user = current_user
    @adventure = current_user.adventures.build(adventure_params)
    respond_to do |format|
      if @adventure.save
        @adventure.parent.populate
        format.html { redirect_to @adventure.parent, notice: 'Adventure was successfully created.' }
        format.js   {}
        format.json { render json: @adventure, status: :created, location: @adventure }
      else
        format.html { render action: "new" }
        format.json { render json: @adventure.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @upload = Upload.new
  end

  def destroy
  	@adventure.destroy
  	redirect_to :back
  end

  def upvote
    @adventure.liked_by current_user
    redirect_to @adventure.parent
  end

  def downvote
    @adventure.disliked_by current_user
    redirect_to @adventure.parent
  end

  def remove_upvote
    @adventure.unliked_by current_user
    redirect_to @adventure.parent
  end

  def remove_downvote
    @adventure.undisliked_by current_user
    redirect_to @adventure.parent
  end

  private

    def set_adventure
      @adventure = Adventure.find(params[:id])
    end

    def adventure_params
      params.require(:adventure).permit(:story, :choice, :parent_id, :user_id, :upload, :image)
    end
end