require "rails_helper"

describe Movie, :type => :model do
  it "has attributes title, description" do
    movie = FactoryGirl.create(:movie)
    movie.save
    expect(movie.title).to eq("My First Movie")
    expect(movie.description).to eq("This is my first description")
  end
end
