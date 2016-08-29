class VotesController < ApplicationController


  def create
    if vote = Vote.find_by(user_id: params[:vote][:user_id], post_id: params[:vote][:post_id])
      if vote.value == -1 && params[:vote][:value].to_i == -1
        vote.update(value: 0)
        redirect_to root_path, notice: "Vote removed!"
      elsif vote.value == 1 && params[:vote][:value].to_i == 1
        vote.update(value: 0)
        redirect_to root_path, notice: "Vote removed!"
      else
        vote.update(value: params[:vote][:value])
        redirect_to root_path, notice: "Vote updated!"
      end
    else
      vote = Vote.create(user_id: params[:vote][:user_id], post_id: params[:vote][:post_id], value: params[:vote][:value])
      redirect_to root_path, notice: "Vote created!"
    end
  end

end
