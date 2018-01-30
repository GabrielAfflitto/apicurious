class User < ApplicationRecord

  def self.update_or_create(auth)
    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {provider: auth[:provider],
                       uid: auth[:uid],
                       name: auth[:info][:name],
                       email: auth[:email]
                      }
    user.save!
    user
  end
end
