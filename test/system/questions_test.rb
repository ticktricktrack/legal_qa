require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  def login
    visit root_path
    fill_in "email_address", with: "user1@example.com"
    fill_in "password", with: "password"
    click_on "Sign in"
  end

  test "Viewing a list of questions" do
    login
    assert_text "Question 2"
  end

  test "Paying an answer fee" do
    login
    click_button "Pay fee: 200.0"
    assert_no_text "Pay fee"
  end
end
