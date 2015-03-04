class DetailsController < ApplicationController
  include CurrentCart
  before_action :set_cart
  layout "main"

  def index
    case_var = 0
    unless (  params.has_key?(:detail) && \
              params[:detail][:brand_id].to_i > 0)
    else
      brand_id = params[:detail][:brand_id].to_i
      case_var += 1
    end
    unless params[:q].nil?
      det_id = params[:q]
      case_var += 2
    else
      det_id = ""
    end
    case case_var
      when 1
        @details = Detail.where(  "brand_id = ?",
                                                "#{brand_id}")
      when 2
        @details = Detail.where(  "detail_id LIKE ? ",
                                                "%#{det_id.upcase}%")
      when 3
        @details = Detail.where(  "detail_id LIKE ? AND brand_id = ?",
                                                "%#{det_id.upcase}%",
                                                "#{brand_id}")
      else
        @details = []
    end
  end

  def show
  end

  def import
    Detail.import_scsv(params[:file], params[:detail][:brand_id].to_i)
    redirect_to static_pages_import_url, notice: "Data uploaded."
  end
end
