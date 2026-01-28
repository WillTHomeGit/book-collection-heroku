require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs (sunny day)' do
    visit new_book_path
    fill_in 'Title', with: 'Harry Potter'
    fill_in 'Author', with: 'JK Rowling'
    fill_in 'Price', with: '19.99'
    select '2025', from: 'book_published_date_1i'
    select 'January', from: 'book_published_date_2i'
    select '1', from: 'book_published_date_3i'
    click_on 'Create Book'
    expect(page).to have_content('Book was successfully created.')
    expect(page).to have_content('Harry Potter')
    expect(page).to have_content('JK Rowling')
    expect(page).to have_content('19.99')
  end

  scenario 'invalid inputs (rainy day)' do
    visit new_book_path
    fill_in 'Title', with: ''
    click_on 'Create Book'
    expect(page).to have_content("Title can't be blank")
  end
end
