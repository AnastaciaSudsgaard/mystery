class ApplicationController < ActionController::Base
    helper_method :current_user
    
    def current_user
        return @current_user if @current_user.present?
    
        if session[:user_id].present?
            @current_user = User.find_by(id: session[:user_id])
        else
            @current_user = User.generate
            session[:login_user_id] = @current_user.id
            @current_user
        end
    end

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
    end

end
