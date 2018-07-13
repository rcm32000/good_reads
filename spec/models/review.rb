require 'rails_helper'

describe Review do
  context 'class methods' do
    book = Book.create(title: 'Stranger in a Strange Land')
    user1 = User.create(name: 'Bob')
    user2 = User.create(name: 'George')
    review1 = book.reviews.create(rating: 5, user_id: user1.id, review: 'Very good!')
    review2 = book.reviews.create(rating: 3, user_id: user2.id, review: 'Okay read.')
    avg = [review1.rating, review2.rating].sum / [review1.rating, review2.rating].count

    expect(avg_rating).to eq(avg)
  end
end
