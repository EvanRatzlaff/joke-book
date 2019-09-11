class RoomsController < ApplicationController
    def new
        @room = Room.new
    end

    def create
        @room = Room.new(set_room)
        if @room.save
          redirect_to rooms_path
        else 
          render :new
        end
    end

    def index
        @rooms = Room.all
    end

    def show
        binding.pry
    end
end
