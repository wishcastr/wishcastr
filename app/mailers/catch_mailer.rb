class CatchMailer < ApplicationMailer

  def account_create(user)

  end

  def test(user)
    @user = user
    mail to: @user.email, subject: 'Testing Wishcastr'
  end

end
