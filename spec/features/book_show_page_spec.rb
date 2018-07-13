require 'rails_helper'


describe 'book_path(book)' do
  scenario 'user sees list of all/average reviews for a single book' do
    book = Book.create(title: 'Stranger in a Strange Land')
    user1 = User.create(name: 'Bob')
    user2 = User.create(name: 'George')
    review1 = book.reviews.create(rating: 5, user_id: user1.id, review: 'Very good!')
    review2 = book.reviews.create(rating: 3, user_id: user2.id, review: 'Okay read.')
    book_avg = [review1.rating, review2.rating].sum / [review1.rating, review2.rating].count

    visit book_path(book)

    expect(page).to have_content(book.title)
    expect(page).to have_content(review1.rating)
    expect(page).to have_content(review1.user.name)
    expect(page).to have_content(review1.review)
    expect(page).to have_content(review2.rating)
    expect(page).to have_content(review2.user.name)
    expect(page).to have_content(review2.review)
    expect(book.reviews.avg_rating).to eq(book_avg)
  end

  scenario 'sees highest rating' do
    book = Book.create(title: 'Stranger in a Strange Land')
    user1 = User.create(name: 'Bob')
    user2 = User.create(name: 'George')
    review1 = book.reviews.create(rating: 5, user_id: user1.id, review: 'Very good!')
    review2 = book.reviews.create(rating: 3, user_id: user2.id, review: 'Okay read.')

    visit book_path(book)

    within '#highest_review' do
      expect(page).to have_content(review1.rating)
      expect(page).to have_content(review1.user.name)
      expect(page).to have_content(review1.review)
      expect(page).to_not have_content(review2.rating)
      expect(page).to_not have_content(review2.user.name)
      expect(page).to_not have_content(review2.review)
    end
  end
end
