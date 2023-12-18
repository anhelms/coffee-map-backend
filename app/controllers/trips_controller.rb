class TripsController < ApplicationController
    def index
        @trips = Trip.all
        render :index
    end

    def create
        @trip = Trip.create(
          user_id: params[:user_id],
          coffee_shops_id: params[:coffee_shops_id],
        )
        render :show
    end

    def show
        @trip = Trip.find_by(id: params[:id])
        render :show
    end
end
