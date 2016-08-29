class User < ApplicationRecord
  has_secure_password
  has_many :votes
  has_many :posts
  has_many :comments, through: :posts
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "50x50>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
