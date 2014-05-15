class PhotosController < ApplicationController

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to :back
    else
      redirect_to :back, alert: "Unable to upload."
    end    
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to :back
  end

  private

    def photo_params
      params.require(:photo).permit(:adventure_id, :image)
    end
end
