class CatchMailer < ApplicationMailer

  def new_account(user)
    @user = user
    if @user
      mail(to: "#{@user.name} <#{@user.email}>", subject: "#{@user.name}, Wishcastr Account Created").deliver_now
    else
      logger.debug("Could not find #{user.inspect}")
    end
  end

  def catch(user, product, wish)
    @user = user
    @product = product
    @wish = wish
    if @user && @product && @wish
      mail(to: "#{@user.name} <#{@user.email}>", subject: "Catch! #{@product.title}")
    else
      logger.debug("Could not find #{user.inspect} or #{product.inspect} or #{wish.inspect}")
    end
  end

  def test(user)
    @user = user
    if @user
      mail(to: @user.email, subject: 'Testing Wishcastr').deliver_now
    else
      logger.debug("Could not find #{user.inspect}")
    end
  end

end
