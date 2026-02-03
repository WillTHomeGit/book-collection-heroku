require 'rails_helper'

RSpec.describe "user_books/index", type: :view do
  before(:each) do
    user = User.create!(username: "Test User")
    book = Book.create!(
      title: "Test Book",
      author: "Author",
      price: 9.99,
      published_date: Date.new(2024, 1, 1)
    )

    assign(:user_books, [
      UserBook.create!(
        user: user,
        book: book
      ),
      UserBook.create!(
        user: user,
        book: book
      )
    ])
  end

  it "renders a list of user_books" do
    render
    assert_select "td", text: "Test User", count: 2
    assert_select "td", text: "Test Book", count: 2
  end
end
