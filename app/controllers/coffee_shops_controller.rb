class CoffeeShopsController < ApplicationController
    def index
        @coffee_shops = CoffeeShop.all
        render :index
    end
end
