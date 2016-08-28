class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def vote_check(hash)
    !!Vote.find_by(hash)
    # !!Vote.find_by(user_id: self.user_id, post_id: self.post_id)
  end


  def vote_update(value)
    self.update(value: value)
  end

end
