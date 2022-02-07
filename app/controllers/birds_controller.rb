class BirdsController < ApplicationController
    def index
      birds = Bird.all
      render json: birds
    end

    def create
      bird = Bird.create(bird_params)
      render json: bird
    end

    def update
      
    end

    def destroy
    end

  private
  def bird_params
    params.require(:bird).permit(:name, :age, :enjoys, :image)
  end

end
