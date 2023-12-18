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

    def show
        @coffee_shop = CoffeeShop.find_by(id: params[:id])
        render :show
    end

    def update
        @coffee_shop = CoffeeShop.find_by(id: params[:id])
        @coffee_shop.update(
            name: params[:name] || @coffee_shop.name,
            latitude: params[:latitude] || @coffee_shop.latitude,
            longitude: params[:longitude] || @coffee_shop.longitude,
        )
        render :show
    end
end
