class User < ApplicationRecord
  validates :email,
  uniqueness: { case_sensitive: false },
  length: { minimum: 4, maximum: 254 }     
end
