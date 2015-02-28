class Detail < ActiveRecord::Base
	belongs_to	:brand
	has_many	:line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  acts_as_copy_target

  def self.import_scsv(file, brandID)
    columns = [:detail_id, :detail_title, :detail_price, :discount_group, :detail_weight,:brand_id, :real_price ]
    data = []
    current_brand_rabats = Rabat.where( brand_id: brandID ).pluck(:title, :value)
    current_brand_rabats_hash = Hash[*current_brand_rabats.flatten]
    # current_brand_rabats.each do |hash|
    #   rabat_hash << { hash[:title] => hash[:value] }
    # end

    SmarterCSV.process( file.path,
                        { :chunk_size => 10000,
                          :col_sep => ";" ,
                          :convert_values_to_numeric => true,
                          :remove_empty_values => false,
                          :key_mapping => { :ptnrdru => :detail_id,
                                            :deutsch => :detail_title,
                                            :euro => :detail_price,
                                            :rabattgruppe => :discount_group,
                                            :gewicht => :detail_weight}}) do |chunk|
      chunk.each do |hash|
        hash[:detail_title] = "noname" if hash[:detail_title] == "" || hash[:detail_title].nil?
        hash[:detail_price] = 0.00 if hash[:detail_price] == "" || hash[:detail_price].nil?
        hash[:detail_weight] = 0.00 if hash[:detail_weight] == "" || hash[:detail_weight].nil?
        hash[:brand_id] = brandID
        prise = BigDecimal(hash[:detail_price].to_s)
        discount_string = hash[:discount_group].to_s
        coefficient = current_brand_rabats_hash[discount_string]
        hash[:real_price] = (prise * coefficient).round(2)
        data << hash.values
      end
      Detail.import(columns, data, validate: false)
      data = []
    end  
  end

  private

  # убеждаемся в отсутствии товарных позиций, ссылающихся на данный товар
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'существуют товарные позиции')
      return false
    end
  end

end
