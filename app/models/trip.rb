class Trip < ApplicationRecord
    belongs_to :user
    belongs_to :coffee_shop, foreign_key: 'coffee_shops_id'
    has_many :reviews
    has_many :images, through: :reviews
end
