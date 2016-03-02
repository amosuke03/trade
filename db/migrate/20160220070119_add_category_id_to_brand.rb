class AddCategoryIdToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :category_id, :integer
  end
end
