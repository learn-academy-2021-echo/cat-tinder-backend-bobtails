class BirdsController < ApplicationController
    def index
      birds = Bird.all
      render json: birds
    end

    def create
      bird = Bird.create(bird_params)
      if bird.valid?
        render json: bird
       else
         render json: bird.errors, status: 422
       end
    end

    def update
      bird = Bird.find(params[:id])
      bird.update(bird_params)
      if bird.valid?
        render json: bird
       else
         render json: bird.errors, status: 422
       end
    end

  private
  def bird_params
    params.require(:bird).permit(:name, :age, :enjoys, :image)
  end
end