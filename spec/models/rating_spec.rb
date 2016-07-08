require "rails_helper"

describe Rating, :type => :model do
  it "has attributes score" do
    rating = Rating.new(score: 3)
    rating.save
    expect(rating.score).to eq(3)
  end
end
