class AddPrice4ToBrand < ActiveRecord::Migration
  def change
      add_column :brands, :price4, :text
  end
end
