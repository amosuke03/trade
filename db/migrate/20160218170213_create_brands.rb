class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.integer :code
      t.text :price1
      t.integer :price2
      t.text :brand_name
      t.text :buyorsell
      t.timestamps null: false
    end
  end
end
