class CoffeeShopsController < ApplicationController
    def index
        @coffee_shops = CoffeeShop.all
        render :index
    end

    def create
        @coffee_shop = CoffeeShop.create(
            name: params[:name],
            latitude: params[:latitude],
            longitude: params[:longitude],
        )
        render :show
    end
end
