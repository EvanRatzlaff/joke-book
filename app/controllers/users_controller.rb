class UsersController < ApplicationController
    # before_action :require_login
    # skip_before_action :require_login, only: [:index]
    def index
        @users = User.all
    end 
    
    def signup
        @user = User.new
    end

    def create
    @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            
            render :signup
        end
    end
    
    def show
      @user = User.find_by_id(params[:id])  
      @joke = @user.jokes.build  
    end

    
    def edit
    
    end
    
    def update

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

    #  def require_login
    #     return head(:forbidden) unless session.include? :user_id
    #     redirect_to :index
    #  end
end