require 'rails_helper'

RSpec.describe "user_books/edit", type: :view do
  let(:user_book) {
    user = User.create!(username: "Test User")
    book = Book.create!(
      title: "Test Book",
      author: "Author",
      price: 9.99,
      published_date: Date.new(2024, 1, 1)
    )

    UserBook.create!(
      user: user,
      book: book
    )
  }

  before(:each) do
    assign(:user_book, user_book)
  end

  it "renders the edit user_book form" do
    render

    assert_select "form[action=?][method=?]", user_book_path(user_book), "post" do
      assert_select "select[name=?]", "user_book[user_id]"
      assert_select "select[name=?]", "user_book[book_id]"
    end
  end
end
