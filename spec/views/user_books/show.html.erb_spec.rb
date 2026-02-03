require 'rails_helper'

RSpec.describe "user_books/show", type: :view do
  before(:each) do
    user = User.create!(username: "Test User")
    book = Book.create!(
      title: "Test Book",
      author: "Author",
      price: 9.99,
      published_date: Date.new(2024, 1, 1)
    )

    assign(:user_book, UserBook.create!(
      user: user,
      book: book
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/User:/)
    expect(rendered).to match(/Book:/)
  end
end
