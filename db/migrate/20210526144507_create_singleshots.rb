class CreateSingleshots < ActiveRecord::Migration[6.0]
  def change
    create_table :singleshots do |t|
      t.string :your_name,            null: false
      t.string :partner_name,            null: false
      t.integer :cook_point
      t.integer :dish_washing_point
      t.integer :laundry_point
      t.integer :bath_washing_point
      t.integer :vacuum_point
      t.integer :your_cook
      t.integer :your_dish_washing
      t.integer :your_laundry
      t.integer :your_bath_washing
      t.integer :your_vacuum
      t.integer :partner_cook
      t.integer :partner_dish_washing
      t.integer :partner_laundry
      t.integer :partner_bath_washing
      t.integer :partner_vacuum
      t.integer :your_cook_sum
      t.integer :your_dish_washing_sum
      t.integer :your_laundry_sum
      t.integer :your_bath_washing_sum
      t.integer :your_vacuum_sum
      t.integer :partner_cook_sum
      t.integer :partner_dish_washing_sum
      t.integer :partner_laundry_sum
      t.integer :partner_bath_washing_sum
      t.integer :partner_vacuum_sum
      t.integer :your_sum
      t.integer :partner_sum
      t.timestamps
    end
  end
end












