class UploadsController < ApplicationController

  def create
    @upload = Upload.new(upload_params)
    if @upload.save
      redirect_to :back
    else
      redirect_to :back, alert: "Unable to upload."
    end    
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    redirect_to :back
  end

  private

    def upload_params
      params.require(:upload).permit(:adventure_id, :image)
    end
end
