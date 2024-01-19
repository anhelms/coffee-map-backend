class ReviewsController < ApplicationController
    def index
        @reviews = Review.all
        render :index
    end

    def create
        @review = Review.create(
            coffee_shops_id: params[:id],
            description: params[:description],
            rating: params[:rating],
            user_id: current_user.id,
        )
        render :show
    end

    def show
        @review = Review.find_by(id: params[:id])
        render :show
    end

    def update
        @review = Review.find_by(id: params[:id])
        @review.update(
            coffee_shops_id: params[:coffee_shops_id] || @review.coffee_shops_id,
            trip_id: params[:trip_id] || @review.trip_id,
            description: params[:description] || @review.description,
            rating: params[:rating] || @review.rating,
            user_id: params[:user_id] || @review.user_id,
        )
        render :show
    end

    def destroy
        @review = Review.find_by(id: params[:id])
        @review.destroy
        render json: { message: "Review destroyed successfully" }
    end
end
