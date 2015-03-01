class Rabat < ActiveRecord::Base
	belongs_to :brand
	acts_as_copy_target

  def self.import_scsv(file, brandID)
    columns = [:title, :value, :brand_id]
    data = []

    # удаляю старые коефициенты
    Rabat.where( brand_id: brandID ).find_each(batch_size: 200) do |rabat|
      Rabat.find(rabat[:id]).destroy
    end

    SmarterCSV.process( file.path,
                        { :chunk_size => 100,
                          :col_sep => ";" ,
                          :convert_values_to_numeric => false,
                          :remove_empty_values => false }) do |chunk|
      chunk.each do |hash|
        hash[:brand_id] = brandID
        data << hash.values
      end
      Rabat.import(columns, data, validate: false)
      data = []
    end
    columns = [ :detail_id, 
                :detail_title, 
                :detail_price, 
                :discount_group, 
                :detail_weight,
                :brand_id, 
                :real_price ]

    current_brand_rabats = Rabat.where( brand_id: brandID ).pluck(:title, :value).uniq
    current_brand_rabats_hash = Hash[*current_brand_rabats.flatten]

    details_update = []
    Detail.where( brand_id: brandID ).find_in_batches do |details|
      details.each do |detail|

        Detail.where( brand_id: brandID ).destroy_all
        # Detail.find(detail[:id]).destroy

        detail_data = []
byebug
        detail_data << detail[:detail_id]
        detail_data << detail[:detail_title]
        detail_data << detail[:detail_price]
        detail_data << detail[:discount_group]
        detail_data << detail[:detail_weight]
        detail_data << detail[:brand_id]
        prise = BigDecimal(detail[:detail_price].to_s)
        discount_string = detail[:discount_group].to_s
        coefficient = current_brand_rabats_hash[discount_string] || 0
        detail_data << (prise * coefficient).round(2)
        details_update << detail_data
      end
      Detail.import( columns, details_update, :validate => false )
    end

  end
end
