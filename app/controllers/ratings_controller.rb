class RatingsController < ApplicationController

  respond_to :json

  def create
    @movie = Movie.find(params[:movie_id] || params[:rating][:movie_id])
    score = params[:score] || params[:rating][:score]
    @rating = Rating.new(movie: @movie, user: current_user, score: score)

    respond_to do |format|
      format.json do
        @rating.save
        render json: { rating: @rating }
      end
    end
  end

  def show
    @rating = Rating.find(params[:id])

    respond_to do |format|
      format.json {
        render json: { rating: @rating }
      }
    end
  end

  def update
    @rating = Rating.find(params[:id])
    @movie = Movie.find(params[:movie_id] || params[:rating][:movie_id])
    @rating.update_attribute('score', params[:score] || params[:rating][:score])

    respond_to do |format|
      format.json {
        render json: { rating: @rating }
      }
    end
  end
end
