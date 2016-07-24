class FollowersController < ApplicationController
  before_action :current_user

#first time I call these  with postman, I'm unable to do it(undefined column), then I can.
  def do_follow
    #tony could send me almost anything here to identify the user to be followed.
    unless current_user.follows?(User.find_by(id: params[:id]))
       current_user.follow!(User.find(params[:id]))
      render status: 200
    else
      @error = {error: "You cannot follow someone you are already following"}
      render json: @error, status: 400
    end
  end

  def do_unfollow
     if current_user.follows?(User.find_by(id: params[:id]))
       current_user.unfollow!(User.find(params[:id]))
       render status: 200
     else
       @error = {error: "You must be following someone to unfollow them."}
       render json: @error, status: 400
     end
  end


end
