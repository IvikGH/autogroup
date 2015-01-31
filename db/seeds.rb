# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Brand.create(	name: "Bilstein")
Brand.create(	name: "BMW")
Brand.create(	name: "Chevrolet")
Brand.create(	name: "Chrysler")
Brand.create(	name: "Citroen")
Brand.create(	name: "Fiat")
Brand.create(	name: "Ford")
Brand.create(	name: "Honda")
Brand.create(	name: "Hyundai")
Brand.create(	name: "Infiniti")
Brand.create(	name: "Iveco")
Brand.create(	name: "Jaguar")
Brand.create(	name: "KIA")
Brand.create(	name: "Land Rover")
Brand.create(	name: "Mazda")
Brand.create(	name: "Mercedes Benz")
Brand.create(	name: "Mitsubishi")
Brand.create(	name: "Nissan")
Brand.create(	name: "Opel")
Brand.create(	name: "Peugeot")
Brand.create(	name: "Porsche")
Brand.create(	name: "Renault")
Brand.create(	name: "Seat")
Brand.create(	name: "Skoda")
Brand.create(	name: "Subaru")
Brand.create(	name: "Suzuki")
Brand.create(	name: "Toyota")
Brand.create(	name: "VAG")
Brand.create(	name: "Volvo")
Brand.create(	name: "VOTEX")
Brand.create(	name: "ZF")
# Detail.create(	brand: "",
# 								detail_id: "",
# 								detail_title: "",
# 								detail_price: ,
# 								discount_group: ,
# 								detail_weight: )
Detail.create(	brand_id: 1,
								detail_id: "123ABC",
								detail_title: "Shurup",
								detail_price: 23.16,
								discount_group: "3",
								detail_weight: 0.512)
Detail.create(	brand_id: 2,
								detail_id: "ABC123",
								detail_title: "Bolt",
								detail_price: 15.87,
								discount_group: "A",
								detail_weight: 0.656)
Detail.create(	brand_id: 3,
								detail_id: "456CDE",
								detail_title: "Gayka",
								detail_price: 9.23,
								discount_group: "1",
								detail_weight: 0.363)
Detail.create(	brand_id: 4,
								detail_id: "CDE456",
								detail_title: "Dverka",
								detail_price: 65.87,
								discount_group: "B",
								detail_weight: 21.228)
Detail.create(	brand_id: 4,
								detail_id: "1FG478",
								detail_title: "Dverka",
								detail_price: 62.87,
								discount_group: "G",
								detail_weight: 21.228)
