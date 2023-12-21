class Trip < ApplicationRecord
    belongs_to :user
    belongs_to :coffee_shop
    has_many :reviews
    has_many :images, though: :reviews
end
