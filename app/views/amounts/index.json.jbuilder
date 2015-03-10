json.array!(@amounts) do |amount|
  json.extract! amount, :id, :brand_id, :detaill_code, :quantity
  json.url amount_url(amount, format: :json)
end
