class User < ActiveRecord::Base

  def self.create_with_amazon(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.amz_id = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
    end
  end
end
