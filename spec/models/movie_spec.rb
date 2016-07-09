require "rails_helper"

describe Movie, :type => :model do
  it "has attributes title, description" do
    movie = FactoryGirl.create(:movie)
    movie.save
    expect(movie.title).to eq("My First Movie")
    expect(movie.description).to eq("This is my first description")
  end

  it "returns average rating" do
    movie = FactoryGirl.create(:movie)
    first_user = FactoryGirl.create(:user, email: "test1@test.com")
    second_user = FactoryGirl.create(:user, email: "test2@test.com")
    FactoryGirl.create(:rating, movie: movie, user: first_user, score: 5)
    FactoryGirl.create(:rating, movie: movie, user: second_user, score: 2)
    expect(movie.average_rating).to eq(3.5)
  end

  it "returns empty value when there is no rating" do
    movie = FactoryGirl.create(:movie)
    expect(movie.average_rating).to eq("-")
  end

  context "validates" do
    it "presence of title" do
      movie = Movie.new()
      movie.save
      errors = {:title => ["can't be blank"]}
      expect(movie.errors.messages).to eq(errors)
    end

    it "uniqueness of title" do
      movie = FactoryGirl.create(:movie, title: "Duplicate Movie")
      duplicate_movie = Movie.new(title: "Duplicate Movie")
      duplicate_movie.save
      errors = {:title => ["has already been taken"]}
      expect(duplicate_movie.errors.messages).to eq(errors)
    end
  end
end
