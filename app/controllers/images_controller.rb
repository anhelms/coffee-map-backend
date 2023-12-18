class ImagesController < ApplicationController
    def index
        @images = Image.all
        render :index
    end

    def create
        @image = Image.create(
          image_url: params[:image_url],
          coffee_shops_id: params[:coffee_shops_id],
        )
        render :show
    end

    def show
        @image = Image.find_by(id: params[:id])
        render :show
    end
end
