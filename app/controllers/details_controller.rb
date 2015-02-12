class DetailsController < ApplicationController
  include CurrentCart
  before_action :set_cart
  
  def index
  	brandId = ( params.has_key?(:details) ? params[:detail][:brand_id].to_i \
                                          : 0 )
    detId = ( params.has_key?(:q) ? params[:q] \
                                          : "" )
  	if brandId != 0
  		@details = Detail.where(	"detail_id LIKE ? AND brand_id = ?",
								  														"%#{detId.upcase}%", 
								  														"#{brandId}")
  	else
  		@details = Detail.where(	"detail_id LIKE ? ",
																							"%#{detId.upcase}%")
  	end
  end

  def show
  end

  def import
    Detail.import_scsv(params[:file], params[:detail][:brand_id].to_i)
    redirect_to static_pages_import_url, notice: "Data uploaded."
  end
end
