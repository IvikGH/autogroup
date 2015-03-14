class RabatsController < ApplicationController
	def import
    Rabat.import_scsv(params[:file], params[:detail][:brand_id].to_i)
    redirect_to static_pages_import_url, notice: "Data uploaded."
  end

  private

  def rabat_params
      params.require(:rabat).permit(:brand_id, :title, :value)
  end

end
