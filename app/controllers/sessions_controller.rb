class SessionsController < ApplicationController
    before_action :redirect_for_logged_in, except: [:destroy]
 
    def new #this is my login
        @user = User.new
    end

    def create #this is post_login
        if auth 
            @user = User.find_or_create_by_omniauth(auth)
                session[:user_id] = @user.id
                redirect_to user_jokes_path(@user)
            else
                @user = User.find_by(email: user_params[:email])
                if @user && @user.authenticate(user_params[:password])
                    session[:user_id] = @user.id
                    redirect_to user_jokes_path(@user)
        else 
            flash[:alert] = "Username, Email, or password invalid"
            render :new
                end
         end
    end

    def destroy #logout
        session.clear
        redirect_to root_path
    end

    private 
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def auth
        request.env['omniauth.auth']
    end
end
