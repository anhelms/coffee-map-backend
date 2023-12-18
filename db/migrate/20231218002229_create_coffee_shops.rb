class CreateCoffeeShops < ActiveRecord::Migration[7.0]
  def change
    create_table :coffeeshops do |t|
      # has_many reviews
      # has_many trips
      # has_many images

      t.string :name
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
