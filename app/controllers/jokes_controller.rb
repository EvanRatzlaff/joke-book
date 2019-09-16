class JokesController < ApplicationController
     before_action :redirect_for_logged_out
     before_action :set_user
     before_action :set_room, only: [:create]
     before_action :set_joke, except: [:index, :new, :create]
    
    def index
        @jokes = Joke.search(params[:query], @user)
    end
    
    def new
      @joke = Joke.new
      set_room
    end

    def create
     @joke = current_user.jokes.build(joke_params)
     if @joke.save
       redirect_to user_jokes_path(current_user)
      else 
        flash[:alert] = @joke.errors.full_messages.join(", ")
        render :new
      end
    end

    def show
      set_user
      set_joke
      set_room
     
    end
    
    
    
    def edit
    redirect_to user_jokes_path(current_user) unless current_user == @user
    end
    
    def update
      if @joke.update(joke_params)
        redirect_to user_joke_path(@joke)
      else
        render :edit
      end
    end
    
    def destroy
      @joke.destroy
      redirect_to user_jokes_path
    end

    private
    def set_joke
        @joke = Joke.find_by_id(params[:id])
    end
    def set_user
        @user = User.find_by_id(params[:user_id])
    end
    def set_room
      @room = Room.find_by_id(params[:id])
    end

    def joke_params
        params.require(:joke).permit(:title, :content, :user_id, :room_id, :like_id, room: [:name])
    end
end
