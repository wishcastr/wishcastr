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

  # test "account created" do
  #     email = CatchMailer.new_account()
  #     assert_not ActionMailer::Base.deliveries.empty?
  #
  #     assert_equal ['catch@wishcastr.com'], email.from
  #     assert_equal ['david@wishcastr.com'], email.to
  #     assert_equal 'Thanks for joining us!', email.subject
  #     assert_equal read_fixture('Welcome').join, email.body.to_s
  # end
end
