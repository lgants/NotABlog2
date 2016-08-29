class Post < ApplicationRecord
  belongs_to :user
  has_many :votes
  has_many :comments
  acts_as_votable
  has_attached_file :post_image, styles: { medium: "300x300>", thumb: "50x50>" }
  validates_attachment_content_type :post_image, content_type: /\Aimage\/.*\z/
end
