require "rails_helper"

describe Rating, :type => :model do
  it "has attributes score" do
    rating = FactoryGirl.create(:rating)
    expect(rating.score).to eq(1)
  end
end
