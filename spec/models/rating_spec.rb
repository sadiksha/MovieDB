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

  context "checks if the rating already exists for user and movie" do
    it "when there is movie and no rating" do
      user = create(:user)
      movie = create(:movie)
      result = Rating.exists_for_user_and_movie?(movie, user)
      expect(result).to be nil
    end

    it "when there is rating for a movie" do
      rating = create(:rating)
      movie = rating.movie
      user = rating.user
      result = Rating.exists_for_user_and_movie?(movie, user)
    end
  end
end
