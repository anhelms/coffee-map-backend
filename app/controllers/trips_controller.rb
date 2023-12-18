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

    def update
        @trip = Trip.find_by(id: params[:id])
        @trip.update(
          user_id: params[:user_id] || @trip.user_id,
          coffee_shops_id: params[:coffee_shops_id] || @trip.coffee_shops_id,
        )
        render :show
    end

    def destroy
        @trip = Trip.find_by(id: params[:id])
        @trip.destroy
        render json: { message: "Trip destroyed successfully" }
      end
end
