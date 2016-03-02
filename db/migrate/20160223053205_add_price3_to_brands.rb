class AddPrice3ToBrands < ActiveRecord::Migration
  def change
        add_column :brands, :price3, :text
  end
end
