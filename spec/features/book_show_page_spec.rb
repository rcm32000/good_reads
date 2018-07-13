require 'rails_helper'


describe 'book_path(book)' do
  scenario 'user sees list of all reviews for a single book' do
    book = Book.create(title: 'Stranger in a Strange Land')
    user1 = User.create(name: 'Bob')
    user2 = User.create(name: 'George')
    review1 = book.reviews.create(rating: 5, user_id: user1.id, review: 'Very good!')
    review2 = book.reviews.create(rating: 3, user_id: user2.id, review: 'Okay read.')
    visit book_path(book)

    expect(page).to have_content(book.title)
    expect(page).to have_content(review1.rating)
    expect(page).to have_content(review1.user.name)
    expect(page).to have_content(review1.review)
    expect(page).to have_content(review2.rating)
    expect(page).to have_content(review2.user.name)
    expect(page).to have_content(review2.review)
  end
end
