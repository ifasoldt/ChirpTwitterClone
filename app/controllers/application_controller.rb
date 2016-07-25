class ApplicationController < ActionController::API

  def current_user
    if params[:token] && User.exists?(token: params[:token])
      @user ||= User.find_by(token: params[:token])
    end
    @user
  end

  def require_user
    render json: {error: "You need to be logged in to do that"}, status: :forbidden unless current_user
  end

  def pagination_dict(object)
    {
      current_page: object.current_page,
      next_page: object.next_page,
      prev_page: object.prev_page, # use object.previous_page when using will_paginate
      total_pages: object.total_pages,
      total_count: object.total_count
    }
  end
end
