class CreateRabats < ActiveRecord::Migration
  def change
    create_table :rabats do |t|
    	t.integer :brand_id, index: true
    	t.string 	:title, index: true
    	t.decimal	:value, precision: 7, scale: 3

      t.timestamps null: false
    end
  end
end
