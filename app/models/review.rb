class Review < ApplicationRecord
    belongs_to :user
    belongs_to :coffee_shop, foreign_key: 'coffee_shops_id'
    belongs_to :trip, optional: true
    has_many :images, through: :coffee_shops, foreign_key: 'coffee_shops_id'
end