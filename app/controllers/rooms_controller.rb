class RoomsController < ApplicationController
    before_action :set_user
    
    def index
        @rooms = Room.search(params[:query], @user)
    end

    def new
        @room = Room.new
    end

    def create
        @room = current_user.rooms.build(room_params)
        if @room.save
          redirect_to user_rooms_path(current_user)
        else 
          render :new
        end
    end

    def edit
        redirect_to user_rooms_path(current_user) unless current_user == @user
    end

    def update
        if @room.update(joke_params)
            redirect_to user_room_path(@room)
        else 
            render :edit
        end
    end
    def show
        set_room
        @jokes = @room.jokes

    end

    def destroy
        @room.destroy
        redirect_to user_rooms_path
    end

private
    def set_room
        @room = Room.find_by_id(params[:id])
    end

    def set_user
        @user = User.find_by_id(params[:user_id])
    end

    def set_joke
        @joke = Joke.find_by_id(params[:id])
    end

    def room_params
        params.require(:room).permit(:name, :location, :performance_charge, :description)
    end

end
