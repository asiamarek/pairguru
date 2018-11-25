class UsersController < ApplicationController
  def top_commenters
    @users = User.top_commenters
  end
end
