class JokesController < ApplicationController
    # before_action :redirect_for_logged_out
    # before_action :set_user
    # before_action :set_room, except: [:index, :new, :create]
    
    def index
        if params[:query]
        @jokes = Joke.search(params[:query], @user)
        else 
          @jokes = Joke.all
        end
    end
    
    def show
      @comment = @joke.comments.build(joke_params)
    end
    
    def new
      @joke = Joke.new
    end
    
    def create
     @joke = current_user.jokes.build(joke_params)
      if @joke.save
        redirect_to jokes_path
      else 
        # binding.pry
        render :new
      end
    end
    
    def edit
    
    end
    
    def update
      if @joke.update(joke_params)
        redirect_to joke_path(@joke)
      else
        render :edit
      end
    end
    
    def destroy

    end

    private
    def set_joke
        @joke = Joke.find_by(params[:id])
    end

    def joke_params
        params.require(:joke).permit(:title, :content, :user_id, :room_id)
    end
end
