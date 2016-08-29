class WelcomeController < ApplicationController

  def show
    @vote = Vote.new
    @sorted_posts = Post.all.sort_by {|post| -post.get_upvotes.size}
  end
end
