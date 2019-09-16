class ApplicationController < ActionController::Base

    helper_method :current_user
    helper_method :logged_in?

    def redirect_for_logged_in
        redirect_to user_jokes_path(current_user) if logged_in?
    end

    def redirect_for_logged_out
        redirect_to login_path unless logged_in?
    end


    private
    def current_user
        User.find_by_id(session[:user_id]) if logged_in?
    end

    def logged_in?
        !!session[:user_id]
    end
end
