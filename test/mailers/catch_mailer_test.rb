require 'test_helper'

class CatchMailerTest < ActionMailer::TestCase
  setup do
    @user = users(:one)
    @wish = wishes(:one)
    @product = products(:one)
  end

  test "catch mailer method" do
    email = CatchMailer.catch(@user, @product, @wish)
    assert_match "Catch!", email.subject
    assert_equal ["MyString@you.com"], email.to
    assert_equal ["catch@wishcastr.com"], email.from
    assert_match "Caught", email.body.encoded
  end

  test "could not find user" do
    email = CatchMailer.catch("David")
    assert "Could not find David"
  end
end
