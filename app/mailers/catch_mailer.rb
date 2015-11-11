class CatchMailer < ApplicationMailer

  def new_account(user)
    @user = user
    mail(to: "#{@user.name} <#{@user.email}>", subject: "#{@user.name}, Wishcastr Account Created")
  end

  def catch(user, product)

  end

  def test(user)
    @user = user
    mail to: @user.email, subject: 'Testing Wishcastr'
  end

end
