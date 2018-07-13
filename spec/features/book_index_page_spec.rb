require 'rails_helper'


describe 'books_path' do
  scenario 'user sees list of all books' do
    book1 = Book.create(title: 'Stranger in a Strange Land')
    book2 = Book.create(title: 'Starship Troopers')
    visit books_path

    expect(page).to have_content(book1.title)
    expect(page).to have_content(book2.title)
  end
end
