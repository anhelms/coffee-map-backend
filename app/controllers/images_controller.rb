class ImagesController < ApplicationController
    def index
        @images = Image.all
        render :index
    end

    def create
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
          coffee_shops_id: params[:coffee_shops_id],
        )
        render :show
    end

    def show
        @image = Image.find_by(id: params[:id])
        render :show
    end

    def update
        @image = Image.find_by(id: params[:id])
        @image.update(
          image_url: params[:image_url] || @image_url.name,
          coffee_shops_id: params[:coffee_shops_id] || @image.coffee_shops_id,
        )
        render :show
    end

    def destroy
        @image = Image.find_by(id: params[:id])
        @image.destroy
        render json: { message: "Image destroyed successfully" }
      end
end
