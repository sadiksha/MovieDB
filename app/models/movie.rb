class Movie < ActiveRecord::Base
  # has two attributes title and description
  belongs_to :category
  has_many :ratings
  has_many :users, through: :ratings

  accepts_nested_attributes_for :category
end
