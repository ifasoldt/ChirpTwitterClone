class ApplicationController < ActionController::API

  def current_user
    if params[:token] && User.exists?(token: params[:token])
      @user ||= User.find_by(token: params[:token])
    end
    @user
  end
end
