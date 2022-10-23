class LoginUsersController < ApplicationController
    def show
        @login_user = LoginUser.find(params[:id]) 
    end
end
