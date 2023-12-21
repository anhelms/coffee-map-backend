class Review < ApplicationRecord
    belongs_to :user
    belongs_to :coffee_shop
    belongs_to :trip 
    has_many :images, through: :coffee_shops
end
