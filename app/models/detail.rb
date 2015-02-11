class Detail < ActiveRecord::Base
	belongs_to	:brand
	has_many	:line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  def self.import_scsv(file)
    columns = [:detail_id, :detail_title, :detail_price, :discount_group, :detail_weight]
    data = []
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
        data << hash.values
      end
      Detail.import(columns, data, validate: false)
    end  
  end

  # create_table "details", force: :cascade do |t|
  #   t.integer  "brand_id"
  #   t.string   "detail_id",                              null: false
  #   t.string   "detail_title"
  #   t.decimal  "detail_price",   precision: 8, scale: 2, null: false
  #   t.string   "discount_group",                         null: false
  #   t.float    "detail_weight",                          null: false
  #   t.datetime "created_at",                             null: false
  #   t.datetime "updated_at",                             null: false
  # end


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
