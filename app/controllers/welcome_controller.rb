class WelcomeController < ApplicationController

  def show
    @posts = Post.all
  end
end
