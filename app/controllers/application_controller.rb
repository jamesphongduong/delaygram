class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    # similar to private but can be shared between inheritance
    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
    end

    # if manually written, require uses makes it that the params must come in the scope/hash of user 
    # params.require(:user).permit(:email, :password, :first_name, :last_name)
end
