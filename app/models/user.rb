class User < ApplicationRecord

  has_many :voterecords
  has_many :images, through: :voterecords



  #ldap登录
  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first

    if user
      return user
    else
      user = User.new
      user.name = auth.info.name
      user.email = auth.info.email
      user.nickname = auth.info.nickname
      user.title = auth.info.title
      user.location = auth.info.location
      user.uid = auth.info.uid
      user.description = auth.info.description
      user.vote = 10

      if user.save
  			return user
  		else
        return false
  		end

    end
  end
end
