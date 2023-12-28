class Image < ApplicationRecord
    belongs_to :coffee_shop, foreign_key: 'coffee_shops_id'
end
