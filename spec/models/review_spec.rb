require 'rails_helper'

describe Review, type: :model do
  it 'is not valid if the rating is more than 5' do
    Restaurant.new(name: "Moe's Tavern").save(validate: false)
    review = Review.new(rating: 10)
    expect(review).to have(1).error_on(:rating)
  end
end
