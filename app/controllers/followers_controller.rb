class FollowersController < ApplicationController
  before_action :current_user

#first time I call these  with postman, I'm unable to do it(undefined column), then I can.
  def do_follow
    #tony could send me almost anything here to identify the user to be followed.
    current_user.follow!(User.find(params[:id]))
  end

  def do_unfollow
    current_user.unfollow!(User.find(params[:id]))
  end


end
