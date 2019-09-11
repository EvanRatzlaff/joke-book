class HomeController < ApplicationController
    before_action :redirect_for_logged_in
    def index
        @user = current_user if logged_in?
            if !logged_in?
            flash[:alert] = "Please Sign in to get started."
            else 
                render :signup
            end
    end

end