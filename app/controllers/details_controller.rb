class DetailsController < ApplicationController
  def index
  	@details = Detail.where("detail_id LIKE ?", "%#{params[:q].upcase}%")
  	# @details = Detail.where "detail_id LIKE :txt", txt: "%#{params[:q].upcase}%"
  end

  def show
  end
end
