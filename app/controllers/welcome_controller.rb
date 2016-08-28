class WelcomeController < ApplicationController

  def show
    @vote = Vote.new
    @posts = Post.all
  end
end
