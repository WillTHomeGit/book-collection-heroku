require 'rails_helper'

RSpec.describe "user_books/new", type: :view do
  before(:each) do
    user = User.create!(username: "Test User")
    book = Book.create!(
      title: "Test Book",
      author: "Author",
      price: 9.99,
      published_date: Date.new(2024, 1, 1)
    )

    assign(:user_book, UserBook.new(
      user: user,
      book: book
    ))
  end

  it "renders new user_book form" do
    render

    assert_select "form[action=?][method=?]", user_books_path, "post" do
      assert_select "select[name=?]", "user_book[user_id]"
      assert_select "select[name=?]", "user_book[book_id]"
    end
  end
end
