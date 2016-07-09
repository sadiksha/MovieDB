class Rating < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  validate :avoid_duplication

  def self.exists_for_user_and_movie?(movie, user)
    Rating.where(movie: movie, user: user).first
  end

  private

  def avoid_duplication
    duplicate_exists = Rating.exists_for_user_and_movie?(movie, user)
    if duplicate_exists
      errors.add(:rating, "can't be created twice for same user and movie.")
    end
  end
end
