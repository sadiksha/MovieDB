class Movie < ActiveRecord::Base
  # has two attributes title and description
  belongs_to :category

  accepts_nested_attributes_for :category
end
