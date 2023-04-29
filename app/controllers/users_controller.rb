class UsersController < ApplicationController
    # before_action :default_avatar

    # def default_avatar
    #     if !self.avatar.attached?
    #         self.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'no-image.png')), filename: 'no-image.png', content_type: 'image/png')
    #     end
    # end

    def new  
        @user = User.new
    end

    def create 
        @user = User.create params.require(:user).permit(:username, :profile, :avatar, :email, :password)
        redirect_to @user
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to @user
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :profile, :avatar)
    end
end
