class Detail < ActiveRecord::Base
	belongs_to	:brand
	has_many	:line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  def self.import(file)
    # @file = file
    SmarterCSV.process( file.path,
                        { :chunk_size => 2,
                          :col_sep => ";" ,
                          :key_mapping => { :PTNRDRU => :detail_id,
                                            :Deutsch => :detail_title,
                                            :Euro => :detail_price,
                                            :RABATTGRUPPE => :discount_group,
                                            :Gewicht => :detail_weight}}) do |chunk|
      Detail.import chunk
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
