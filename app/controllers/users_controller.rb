class UsersController < ApplicationController
    def account
        @user = User.find(current_user.id)
    end

    def profile
         @user = User.find(current_user.id)
    end

    def new  
        @user = User.new
    end

    def create 
        @user = User.create params.require(:user).permit(:username, :profile, :avatar, :email, :password)
        redirect_to "users_profile_path"
    end
    
    def profile_edit
        @user = User.find(current_user.id)
    end

    def update
        @user = User.find(current_user.id)
        @user.update(user_params)
        redirect_to users_profile_path
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:notice] = "ログアウトしました"
        redirect_to home/index
      end
   
    private
    def user_params
        params.require(:user).permit(:username, :email, :profile, :avatar)
    end
end
