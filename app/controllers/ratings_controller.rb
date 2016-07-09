class RatingsController < ApplicationController
  def new
    @movie = Movie.find(params[:movie_id])
    @rating = Rating.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @rating = Rating.new(movie: @movie, user: current_user, score: params["score"])
    if @rating.save
      redirect_to movies_path
    end
  end

  def edit
    @movie = Movie.find(params[:movie_id])
    @rating = Rating.find(params[:id])
  end

  def update
    @rating = Rating.find(params[:id])
    @rating.update(score: params[:score])
    redirect_to movies_path
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to movies_path
  end
end
