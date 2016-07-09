require "rails_helper"

describe Category, :type => :model do
  it "has attribute name" do
    category = FactoryGirl.create(:category)
    category.save
    expect(category.name).to eq("Category")
  end

  it "has many movies" do
    category = FactoryGirl.create(:category, name: "Comedy")
    FactoryGirl.create(:movie, category: category)
    FactoryGirl.create(:movie, category: category, title: "Second movie")
    expect(category.movies.count).to eq(2)
    Movie.all.each do |movie|
      expect(movie.category.name).to eq("Comedy")
    end
  end

  it "orders category by ascending name by default" do
    ["horror", "animated", "comedy"].each do |category_name|
      FactoryGirl.create(:category, name: category_name)
    end
    category_names = Category.all.map(&:name)
    expected = ["animated", "comedy", "horror"]
    expect(category_names).to eq(expected)
  end
end
