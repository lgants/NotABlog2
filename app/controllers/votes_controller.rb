class VotesController < ApplicationController

  def create
    post = Post.find(params[:vote][:post_id])

    if params[:vote][:vote_type] == "upvote"
      post.upvote_by current_user
      redirect_to root_path
    elsif params[:vote][:vote_type] == "downvote"
      post.downvote_by current_user
      redirect_to root_path
    end
  end
end
