class Brand < ActiveRecord::Base
	has_many	:details
	has_many	:rabats
end
