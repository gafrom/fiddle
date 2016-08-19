class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :product_category
      t.integer :value
      t.string :product_name
      t.string :vendor
      t.string :phone
      t.string :customer_name
      t.string :zip_code
      t.string :city
      t.string :street

      t.timestamps
    end
  end
end
