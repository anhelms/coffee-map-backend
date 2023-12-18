class ReviewsController < ApplicationController
    def index
        @reviews = Review.all
        render :index
    end

    def create
        @review = Review.create(
            coffee_shops_id: params[:coffee_shops_id],
            trip_id: params[:trip_id],
            description: params[:description],
            rating: params[:rating],
            user_id: params[:user_id],
        )
        render :show
    end

    def show
        @review = Review.find_by(id: params[:id])
        render :show
    end
end
