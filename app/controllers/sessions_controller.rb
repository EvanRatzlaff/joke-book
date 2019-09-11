class SessionsController < ApplicationController
    def login
        @user = User.new
    end

    def create
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.name = auth['info']['email']
            u.name = auth['info']['image']
            end
            if @user && @user.authenticate(user_params)
            session[:user_id] = @user.id
            redirect_to root_url, notice:"You are logged in"
        else 
            flash[:alert] = "Username, Email, or password invalid"
            render :new
        end
    end

    # def googleAuth
    #     access_token = request.env["omniauth.auth"]
    #     @user = User.from_omniauth(access_token)
    #     log_in(@user)
    #     @user.google_token = access_token.credentials.token 
    #     refresh_token = access_token.credentials.refresh_token
    #     @user.google_refresh_token = refresh_token if
    #     refresh_token.present?
    #     @user.save
    #     redirect_to root_path
    # end

    def destroy
        session[:user_id] = nil
        redirect_to root_url, notice: "See ya later!"
    end

    private 
    def user_params
        params.require(:user).permit(:username, :email, :password, :user_id)
    end

    def auth
        request.env['omniauth.auth']
    end
end
