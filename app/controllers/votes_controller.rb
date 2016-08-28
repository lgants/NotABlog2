class VotesController < ApplicationController
  protect_from_forgery except: :create
  # def new
  #     @vote = Vote.new(vote_params)
  # end


  def create

    if Vote.find_by(user_id: params[:vote][:user_id], post_id: params[:vote][:post_id])
      old_vote = Vote.find_by(user_id: params[:vote][:user_id], post_id: params[:vote][:post_id])
      old_vote.destroy
      new_vote = Vote.create(user_id: params[:vote][:user_id], post_id: params[:vote][:post_id])
      post = Post.find(params[:vote][:post_id])
      post.votes << new_vote
      post.save
      redirect_to root_path, notice: "Vote updated!"
    else
      new_vote = Vote.create(user_id: params[:vote][:user_id], post_id: params[:vote][:post_id])
      post = Post.find(params[:vote][:post_id])
      post.votes << new_vote
      post.save
      redirect_to root_path, notice: "Vote created!"
    end


    # if Vote.find_by(user_id: current_user.id, post_id: params[:vote][:post_id])
    #   old_vote = Vote.find_by(user_id: current_user.id, post_id: params[:vote][:post_id])
    #   old_vote.update(value: params[:vote][:updown])
    #   redirect_to root_path, notice: "Vote updated!"
    # else
    #   new_vote = Vote.new(post_id: params[:vote][:post_id], user_id: current_user.id, value: params[:vote][:updown])
    #   vote.save
    #   redirect_to root_path, notice: "Vote created!"
    # end
  end


  private
  def vote_params
    params.require(:vote).permit(:user_id, :post_id, :value)
  end
end
