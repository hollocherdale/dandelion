class AdventuresController < ApplicationController
  before_filter :authenticate_user!, except: [:home, :show, :about, :new]

  def home
    @adventures = Adventure.all
    @top_adventures = Adventure.where(state: "pending").order(vote_count: :desc).first(2)
  end

  def index
  	@adventures = Adventure.scoped
  end

  def new
    @vote = Vote.new
  	@adventure = Adventure.new
    @parent = Adventure.find(params[:id])
    if @parent.published_open?
      @submissions = Adventure.find(params[:id]).children
    else
      redirect_to root_url
      flash[:error] = "Sorry, that adventure is already populated."
    end
  end

  def show
    @adventure = Adventure.find(params[:id])
    @submissions = Adventure.find(params[:id]).children
  end

  def create
  	@user = current_user
    @adventure = current_user.adventures.build(adventure_params)
    respond_to do |format|
      format.html { redirect_to adventure_url }
      format.js
    end
    # if @adventure.save
    #   flash[:success] = "Adventure created!"
    #   redirect_to @adventure.parent
    # else
    #   flash[:error] = "There was an error"
    #   redirect_to :back
    # end
  end

  def edit
    @adventure = Adventure.find(params[:id])
    @upload = Upload.new
  end

  def destroy
  	@adventure = Adventure.find(params[:id])
  	@adventure.destroy
  	redirect_to :back
  end

  private

    def adventure_params
      params.require(:adventure).permit(:story, :choice, :parent_id, :user_id, :upload, :image)
    end
end