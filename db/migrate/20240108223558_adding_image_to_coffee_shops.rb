class AddingImageToCoffeeShops < ActiveRecord::Migration[7.0]
  def change
    add_column :coffee_shops, :image_url, :string 
  end
end
