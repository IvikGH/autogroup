class ChangeHstoreDefault < ActiveRecord::Migration
  def up
    change_column_default :users,
                          :brands_margins,
                          { :quantity_to_cart => 1,
                            "Bilstein" => 3,
                            "BMW" => 3,
                            "Chevrolet" => 3,
                            "Chrysler" => 3,
                            "Citroen" => 3,
                            "Fiat" => 3,
                            "Ford" => 3,
                            "Honda" => 3,
                            "Hyundai" => 3,
                            "Infiniti" => 3,
                            "Iveco" => 3,
                            "Jaguar" => 3,
                            "KIA" => 3,
                            "Land Rover" => 3,
                            "Mazda" => 3,
                            "Mercedes Benz" => 3,
                            "Mitsubishi" => 3,
                            "Nissan" => 3,
                            "Opel" => 3,
                            "Peugeot" => 3,
                            "Porsche" => 3,
                            "Renault" => 3,
                            "Seat" => 3,
                            "Skoda" => 3,
                            "Subaru" => 3,
                            "Suzuki" => 3,
                            "Toyota" => 3,
                            "VAG" => 3,
                            "Volvo" => 3,
                            "VOTEX" => 3,
                            "ZF" => 3 }
  end

  def down
    change_column_default :users,
                          :brands_margins,
                          { :quantity_to_cart => 1 }
  end
end
