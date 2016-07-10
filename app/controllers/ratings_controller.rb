class RatingsController < ApplicationController
  def new
    @movie = Movie.find(params[:movie_id])
    if Rating.exists_for_user_and_movie?(@movie, current_user)
      flash[:notice] = "You cannot rate one movie twice."
      redirect_to movies_path
    else
      @rating = Rating.new
    end
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @rating = Rating.new(movie: @movie, user: current_user, score: params["score"])
    if @rating.save
      redirect_to movie_path(@movie)
    end
  end

  def edit
    @movie = Movie.find(params[:movie_id])
    @rating = Rating.find(params[:id])
  end

  def update
    @rating = Rating.find(params[:id])
    @movie = Movie.find(params[:movie_id])
    @rating.update(score: params[:score])
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to movies_path
  end
end
