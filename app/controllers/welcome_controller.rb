class WelcomeController < ApplicationController

  def show
    @vote = Vote.new
    @sorted_posts = Post.all.sort_by {|post| -post.vote_sum}
  end
end
