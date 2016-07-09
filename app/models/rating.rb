class Rating < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  def self.exists_for_user_and_movie?(movie, user)
    Rating.where(movie: movie, user: user).first
  end
end
