class User < ApplicationRecord

  def self.update_or_create(auth)
    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {uid: auth[:uid],
                       nickname: auth[:info][:nickname],
                       name: auth[:info][:name],
                       email: auth[:info][:email],
                       token: auth[:credentials][:token]
                      }
                      # binding.pry
    user.save!
    user
  end
end
