class AccountsController < ApplicationController
  def show
    @user = User.find(:user_id)
  end
end
