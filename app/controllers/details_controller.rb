class DetailsController < ApplicationController
  def index
  	@details = Detail.where(	"detail_id LIKE ? AND brand_id = ?",
  														"%#{params[:q].upcase}%", 
  														"#{params[:detail][:brand_id].to_i}"
														)
  	# @details = Detail.where "detail_id LIKE :txt", txt: "%#{params[:q].upcase}%"
  end

  def show
  end
end
