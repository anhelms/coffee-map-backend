class ChangeLatLongToDecimalInCoffeeShops < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      UPDATE coffee_shops SET latitude = '0' WHERE latitude IS NULL;
      UPDATE coffee_shops SET longitude = '0' WHERE longitude IS NULL;
    SQL

    change_column :coffee_shops, :latitude, :decimal, precision: 10, scale: 8, using: 'COALESCE(NULLIF(latitude, \'\')::numeric, 0)'
    change_column :coffee_shops, :longitude, :decimal, precision: 11, scale: 8, using: 'COALESCE(NULLIF(longitude, \'\')::numeric, 0)'
  end

  def down
    change_column :coffee_shops, :latitude, :string
    change_column :coffee_shops, :longitude, :string
  end
end
