class DetailsController < ApplicationController
  def index
  	brandId = params[:detail][:brand_id].to_i
  	if brandId != 0
  		@details = Detail.where(	"detail_id LIKE ? AND brand_id = ?",
								  														"%#{params[:q].upcase}%", 
								  														"#{brandId}")
  	else
  		@details = Detail.where(	"detail_id LIKE ? ",
																							"%#{params[:q].upcase}%")
  	end
  end

  def show
  end
end
