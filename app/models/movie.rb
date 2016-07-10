class Movie < ActiveRecord::Base
  # has two attributes title and description
  belongs_to :category
  has_many :ratings
  has_many :users, through: :ratings

  accepts_nested_attributes_for :category

  validates :title, uniqueness: true
  validates :title, presence: true

  def average_rating
    number_of_rating = ratings.count
    return "-" if number_of_rating.zero?
    total_rating = ratings.map(&:score).sum
    ((total_rating / number_of_rating.to_f).to_f).round(2)
  end

  def has_ratings?(user)
    ratings.where(user: user)
  end

  def self.search(category_id, movie)
    searched_movies = []
    if category_id.blank? && movie.blank?
      searched_movies = all
    elsif category_id.blank? && !movie.blank?
      searched_movies = where('title LIKE ?', "%#{movie}%")
    elsif !category_id.blank? && movie.blank?
      searched_movies = where(category_id: category_id)
    else
      searched_movies = where(category_id: category_id).where('title LIKE ?', "%#{movie}%")
    end
    searched_movies
  end

  def rating_for_user(current_user)
    ratings.where(user: current_user).first
  end
end
