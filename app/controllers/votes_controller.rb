class VotesController < ApplicationController


  def create
    if vote = Vote.find_by(user_id: params[:vote][:user_id], post_id: params[:vote][:post_id])
      vote.update(value: params[:vote][:value])
      redirect_to root_path, notice: "Vote updated!"
    else
      vote = Vote.create(user_id: params[:vote][:user_id], post_id: params[:vote][:post_id], value: params[:vote][:value])
      redirect_to root_path, notice: "Vote created!"
    end
  end

end
