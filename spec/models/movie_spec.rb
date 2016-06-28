require "rails_helper"

describe Movie, :type => :model do
  it "has attributes title, description" do
    movie = Movie.new(title: "test movie", description: "test description text")
    movie.save
    expect(movie.title).to eq("test movie")
    expect(movie.description).to eq("test description text")
  end

end
