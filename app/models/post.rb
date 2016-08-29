class Post < ApplicationRecord
  belongs_to :user
  has_many :votes
  has_many :comments
  has_attached_file :post_image, styles: { medium: "300x300>", thumb: "50x50>" }
  validates_attachment_content_type :post_image, content_type: /\Aimage\/.*\z/


  def vote_sum
    tally = 0
    self.votes.each do |vote|
      tally += vote.value
    end
    tally
  end

  # self.votes.each do |vote|
  #   vote.value.inject {|tally, vote_value| tally + vote_value}

end
