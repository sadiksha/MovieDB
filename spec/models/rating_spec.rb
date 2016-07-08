require "rails_helper"

describe Rating, :type => :model do
  it "has attributes score" do
    rating = FactoryGirl.create(:rating)
    expect(rating.score).to eq(1)
  end

  describe "belongs to" do
    it "movie" do
      rating = FactoryGirl.create(:rating)
      movie = rating.movie
      expect(movie.title).to eq("My First Movie")
      expect(movie.description).to eq("This is my first description.")
    end
  end
end
