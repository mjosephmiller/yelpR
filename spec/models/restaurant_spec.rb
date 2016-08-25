require 'rails_helper'

describe Restaurant, type: :model do
  it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(name: "kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it 'is not valid unless it has a unique name' do
    Restaurant.new(name: "Moe's Tavern").save(validate: false)
    restaurant = Restaurant.new(name: "Moe's Tavern")
    expect(restaurant).to have(1).error_on(:name)
  end
end

describe '#average_rating' do
  context 'no reviews' do
    it 'returns "N/A" when there are no reviews' do
      restaurant = Restaurant.create(name: "Moe's Tavern")
      expect(restaurant.average_rating).to eq 'N/A'
    end
  end

  context '1 review' do
    it 'returns that rating' do
      User.create(email: 'test@gmail.com', password:'123456')
      restaurant = Restaurant.create(name: 'The Ivy', user_id: User.first.id)
      restaurant.reviews.create(rating: 4).save(validate: false)
      expect(restaurant.average_rating).to eq 4
    end
  end

  context 'multiple reviews' do
    it 'returns the average' do
      User.create(email: 'test@gmail.com', password:'123456')
      restaurant = Restaurant.create(name: 'The Ivy', user_id: User.first.id)
      restaurant.reviews.create(rating: 2).save(validate: false)
      User.create(email: 'test2@gmail.com', password:'123456')
      restaurant.reviews.create(rating: 5).save(validate: false)
      expect(restaurant.average_rating.to_i).to eq 3
    end
  end

end
