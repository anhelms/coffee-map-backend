class CoffeeShopsController < ApplicationController
    def index
        @coffee_shops = CoffeeShop.all
        render :index
    end

  before_action :authenticate_user

#   # show all coffee shops based on user coordinates
#   def index
#     lat = current_user.latitude
#     lon = current_user.longitude
#     response = HTTP.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=coffee+shop&location=#{lat},#{lon}&radius=10000&region=us&type=cafe&key=#{Rails.application.credentials.google_api[:api_key]}")
#     data = response.parse(:json)
#     data = data["results"]
#     chains = ["Starbucks", "Dunkin'", "Foxtail", "Dutch Bros Coffee", "Foxtail Coffee Bar"]
#     data = data.delete_if { |x| chains.include? x["name"] }
#     @coffee_shops = data
#     render json: @coffee_shops
#   end

#   # show a specific coffee shop
#   def show
#     id = params[:id]
#     response = HTTP.get("https://maps.googleapis.com/maps/api/place/details/json?&place_id=#{id}&fields=name,formatted_address,opening_hours,formatted_phone_number,rating,website,photos,reviews&key=#{Rails.application.credentials.google_api[:api_key]}")
#     @coffee_shop = response.parse(:json)
#     render json: @coffee_shop
#   end

    def create
        results = Geocoder.search(params[:address])
        location = results.first.coordinates
        # => [48.856614, 2.3522219]  # latitude and longitude

        @coffee_shop = CoffeeShop.create(
            name: params[:name],
            image_url: params[:image_url],
            latitude: location[0],
            longitude: location[1],
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
            image_url: params[:image_url] || @coffee_shop.image_url,
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
