class CoffeeShop < ApplicationRecord
    validates :latitude, presence: true
    validates :longitude, presence: true

    has_many :reviews, foreign_key: 'coffee_shops_id'
    has_many :trips, foreign_key: 'coffee_shops_id'
    has_many :images, foreign_key: 'coffee_shops_id'
end
