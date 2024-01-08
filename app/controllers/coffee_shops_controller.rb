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

        if @coffee_shop.valid?
            if(params["image_url"])
                #user sends me image_url
                image_url = params["image_url"]
            elsif(params["image_file"])
                #user sends me image file
                #catch file upload and send to cloudinary
                response = Cloudinary::Uploader.upload(params["image_file"], resource_type: :auto)
                image_url = response["secure_url"]
            else
                #user doesn't send me images
                image_url = nil
            end
    
            @image = Image.create(
              image_url: image_url,
              coffee_shops_id: @coffee_shop.id,
            )
            render :show
          else
            render json: {error: @coffee_shop.errors.full_messages}, status: 422
        end
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

    def destroy
        @coffee_shop = CoffeeShop.find_by(id: params[:id])
        @coffee_shop.destroy
        render json: { message: "Coffee shop destroyed successfully" }
    end
end
