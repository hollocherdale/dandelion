class AdventureCollectionsController < ApplicationController
  before_action :set_adventure_collection, only: [:show, :edit, :destroy]

  def home
    @adventure_collections = AdventureCollection.all
    @top_submissions = Adventure.where(state: 'pending').order(vote_count: :desc)
    @popular_adventures = Adventure.where(state: 'popular').order(vote_count: :desc)
    @unpopulated_adventures = Adventure.where(state: 'accepting_submissions').order(vote_count: :desc)
    @home = true
  end

  def create
    @adventure_collection = current_user.adventure_collections.build(adventure_collection_params)
    if @adventure_collection.save
      redirect_to @adventure_collection
    else
      redirect_to new, 
      flash[:error] = 'Sorry, there was an error.'
    end
  end

  def show
  end

  def destroy
    @adventure_collection.destroy
    redirect_to @adventure_collection
  end

  def new
    @adventure_collection = AdventureCollection.new
  end

  private

  def set_adventure_collection
    @adventure_collection = AdventureCollection.find(params[:id])
  end

  def adventure_collection_params
    params.require(:adventure_collection).permit(:banner, :title)
  end
end
