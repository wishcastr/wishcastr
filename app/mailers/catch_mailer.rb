class CatchMailer < ApplicationMailer

  def new_account(user)
    @user = user
    if @user
      mail(to: "#{@user.name} <#{@user.email}>", subject: "#{@user.name}, Wishcastr Account Created")
    else
      logger.debug("Could not find #{user}")
    end
  end

  def catch(user, product, wish)
    @user = user
    @product = product
    @wish = wish
    if @user && @product && @wish
      mail(to: "#{@user.name} <#{@user.email}>", subject: "Catch! #{@product.title}")
    else
      logger.debug("Could not find #{user} or #{product} or #{wish}")
    end
  end

  def test(user)
    @user = user
    if @user
      mail(to: @user.email, subject: 'Testing Wishcastr')
    else
      logger.debug("Could not find #{@user}")
    end
  end

end
