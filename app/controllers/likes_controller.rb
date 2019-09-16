class LikesController < ApplicationController
    before_action :find_joke
    before_action :find_like, only: [:destroy]

    def create
        if Like.liked?
            flash[:notice] = "You can't double like a joke!"
        else
        @joke.likes.create(user_id: current_user.id)
        
        redirect_to @joke
        end 
    end
    def show
    end

    def destroy
        if !(Like.liked?)
            flash[:alert] = @joke.errors.full_messages.join(", ")
        else 
            @like.destroy
        end
        redirect_to @joke
    end

    private

    def find_joke
        @joke = Joke.find(params[:joke_id])
    end

    def find_like
        @like = @joke.likes.find(params[:id])
    end
    
    
end
