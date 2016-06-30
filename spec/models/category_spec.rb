require "rails_helper"

describe Category, :type => :model do
  it "has attribute name" do
    category = Category.new(name: "test category")
    category.save
    expect(category.name).to eq("test category")
  end
end
