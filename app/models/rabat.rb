class Rabat < ActiveRecord::Base
	belongs_to :brand
	acts_as_copy_target

  def self.import_scsv(file, brandID)
    columns = [:title, :value, :brand_id]
    data = []
    SmarterCSV.process( file.path,
                        { :chunk_size => 100,
                          :col_sep => ";" ,
                          :convert_values_to_numeric => false,
                          :remove_empty_values => false }) do |chunk|
      chunk.each do |hash|
        hash[:brand_id] = brandID
        data << hash.values
      end
# byebug
      Rabat.import(columns, data, validate: false)
      data = []
    end
  end
end
