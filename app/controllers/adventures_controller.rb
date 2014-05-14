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
    @submissions = Adventure.find(params[:id]).children
  end

  def show
    @adventure = Adventure.find(params[:id])
  end

  def create
  	@user = current_user
    @adventure = current_user.adventures.build(adventure_params)
    if @adventure.save
      flash[:success] = "Adventure created!"
      redirect_to :back
    else
      flash[:error] = "There was an error"
      redirect_to :back
    end
  end

  def edit
    @adventure = Adventure.find(params[:id])
  end

  def update
    @adventure = Adventure.find(params[:id])
    if @adventure.update_attributes(adventure_params)
      flash[:success] = "Adventure updated"
      redirect_to @adventure
    else
      render 'edit'
    end
  end

  def destroy
  	@adventure = Adventure.find(params[:id])
  	@adventure.destroy
  	redirect_to :back
  end

  private

    def adventure_params
      params.require(:adventure).permit(:story, :choice, :parent_id, :user_id, :slides)
    end
end
