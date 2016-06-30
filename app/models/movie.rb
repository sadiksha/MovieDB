class Movie < ActiveRecord::Base
  # has two attributes title and description
  belongs_to :category
end
