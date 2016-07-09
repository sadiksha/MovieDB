class RatingsController < ApplicationController
  def new
    @movie = Movie.find(params[:movie_id])
    @rating = Rating.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @rating = Rating.new(movie: @movie, user: current_user, score: params["score"])
    if @rating.save
      redirect_to movie_path(@movie)
    end
  end
end
