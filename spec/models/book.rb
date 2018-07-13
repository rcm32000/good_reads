require 'rails_helper'

describe Review do
  context 'class methods' do
    book = Book.create(title: 'Stranger in a Strange Land')
    user1 = User.create(name: 'Bob')
    user2 = User.create(name: 'George')
    review1 = book.reviews.create(rating: 5, user_id: user1.id, review: 'Very good!')
    review2 = book.reviews.create(rating: 3, user_id: user2.id, review: 'Okay read.')
    highest = [review1, review2].max

    expect(book.highest_review).to eq(highest)
  end
end
