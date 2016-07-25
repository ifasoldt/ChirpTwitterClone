class TildetagsController < ApplicationController

  def index
    @tildetags = Tildetag.all
    render json: @tildetags
  end

  def show
    @tildetag = Tildetag.find_by(name: params[:name])
    render json: @tildetag.tweets
  end
end
