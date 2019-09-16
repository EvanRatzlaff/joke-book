class UsersController < ApplicationController
    before_action :redirect_for_logged_in
    
    def index
        @users = User.all
    end 
    
    def new #signup
        @user = User.new
    end

    def create #post_signup
    user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            
            render :new
        end
    end
    
    def show
      @user = User.find_by_id(params[:id])  
      @joke = @user.jokes.build(joke_params)
      @room = @user.rooms.build(room_params)
    end
    
    def destroy
        User.find(session[:user_id]).destroy
        session[:user_id] = nil
        redirect_to root_path
    end    

    private 
    def user_params
        params.require(:user).permit(:username, :email, :password, :user_id)
    end

    def joke_params
        params.require(:joke).permit(:title, :content, :user_id, :room_id)

    end

    def room_params
        params.require(:room).permit(:name, :location, :performance_charge, :description)
    end
    #  def require_login
    #     return head(:forbidden) unless session.include? :user_id
    #     redirect_to :index
    #  end
end