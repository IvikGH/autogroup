# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Detail.create(	brand: "",
# 								detail_id: "",
# 								detail_title: "",
# 								detail_price: ,
# 								discount_group: ,
# 								detail_weight: )
Detail.create(	brand: "BMW",
								detail_id: "123ABC",
								detail_title: "Shurup",
								detail_price: 23.16,
								discount_group: "3",
								detail_weight: 0.512)
Detail.create(	brand: "Opel",
								detail_id: "ABC123",
								detail_title: "Bolt",
								detail_price: 15.87,
								discount_group: "A",
								detail_weight: 0.656)
Detail.create(	brand: "Honda",
								detail_id: "456CDE",
								detail_title: "Gayka",
								detail_price: 9.23,
								discount_group: "1",
								detail_weight: 0.363)
Detail.create(	brand: "Dodge",
								detail_id: "CDE456",
								detail_title: "Dverka",
								detail_price: 65.87,
								discount_group: "B",
								detail_weight: 21.228)