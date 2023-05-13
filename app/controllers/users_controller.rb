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

    def profile_update
        binding.pry
        @user = User.find(current_user.id)
        if @user.update!(user_params)
            flash[:notice] = "プロフィールの情報を更新しました"
            redirect_to "users_profile_path"
          else
            flash.now[:alert] ="プロフィールの情報を更新できませんでした"
            render "users_profile_edit_path"
          end
    end


    private
    def user_params
        params.require(:user).permit(:username, :email, :profile, :avatar)
    end
end
