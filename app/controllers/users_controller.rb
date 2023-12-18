class UsersController < ApplicationController
    def index
        @users = User.all
        render :index
    end

    def create
        @user = User.create(
            name: params[:name],
            email: params[:email],
            password_digest: params[:password_digest],
            image_url: params[:image_url],
        )
        render :show
    end
end