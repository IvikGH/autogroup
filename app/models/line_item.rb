class LineItem < ActiveRecord::Base
  belongs_to :detail
  belongs_to :cart
end
