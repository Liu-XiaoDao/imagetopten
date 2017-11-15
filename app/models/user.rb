class User < ApplicationRecord

  has_many :voterecords
  has_many :images, through: :voterecords



end
