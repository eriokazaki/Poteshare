class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:show, :index]
    before_action :configure_permitted_parameters, if: :devise_controller?
    private
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
    end

    # def after_sign_in_path_for(resource)
    #     user_path(resource.id)
    # end

end
