require "rails_helper"

describe Category, :type => :model do
  it "has attribute name" do
    category = Category.new(name: "test category")
    category.save
    expect(category.name).to eq("test category")
  end

  it "has many movies" do
    movie = Movie.new
    category = Category.new
    category.movies << movie
    expect(category.movies.first).to be movie
  end

  it "orders category by ascending name by default" do
    first_category = Category.create("horror")
    second_category = Category.create("animated")
    third_category = Category.create("comedy")
    names = Category.all.map(&:name)
    expected = ["animated", "comedy", "horror"]
    expect(names).to eq(expected)
  end
end
