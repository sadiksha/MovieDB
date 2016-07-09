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
end
