class UsersController < ApplicationController
    def index
        @users = User.all
        render :index
    end

    def create
        @user = User.new(
          name: params[:name],
          email: params[:email],
          password: params[:password],
          password_confirmation: params[:password_confirmation],
          image_url: params[:image_url],
        )
        if @user.save
          render json: { message: "User created successfully" }, status: :created
        else
          render json: { errors: @user.errors.full_messages }, status: :bad_request
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def update
        @user = User.find_by(id: params[:id])
        @user.update(
            name: params[:name] || @user.name,
            email: params[:email] || @user.email,
            image_url: params[:image_url] || @user.image_url,
        )
        render :show
    end

    def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy
        render json: { message: "User destroyed successfully"}
    end

    def create_demo_account
        @user = User.new(username: 'demo_user', password: 'demopassword', is_demo: true)

        if @user.save
            render json { token: generate_token(@user) }, status: :created
        else
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def generate_token(user)
    end
end