class UsersController < ApplicationController
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

    def mypage
        redirect_to accounts_show_path(current_user)
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :profile, :avatar)
    end
end
