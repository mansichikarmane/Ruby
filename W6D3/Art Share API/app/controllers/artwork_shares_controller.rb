class ArtworkSharesController < ApplicationController
  def create
    debugger
    share = ArtworkShare.new(share_params)
    if share.save
      render json: share
    else
      render json: share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    share = ArtworkShare.find(params[:id])
    share.destroy
    render json: share
  end

  private

  def share_params
      params.require(:artwork_share).permit(:viewer_id, :artwork_id)
  end
end
