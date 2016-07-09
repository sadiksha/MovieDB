require "rails_helper"

describe Rating, :type => :model do
  it "has attributes score" do
    rating = FactoryGirl.create(:rating)
    expect(rating.score).to eq(1)
  end

  it "belongs to user and movie" do
    rating = FactoryGirl.create(:rating)
    user = rating.user
    movie = rating.movie
    expect(user.email).to eq("test@test.com")
    expect(movie.title).to eq("My First Movie")
  end
end
