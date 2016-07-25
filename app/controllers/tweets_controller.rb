class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :update, :destroy]
  before_action :current_user
  before_action :require_user


  #Tony or I probably should redirect if current user is not logged in.


  def index
    if params[:page]
      render json: current_user, scope: {page: params[:page]}, serializer: UserWithTweetsSerializer, meta: {total_pages: current_user.timeline_tweets.count/25}
    else
      render json: current_user, serializer: UserWithTweetsSerializer
    end
  end

  # GET /tweets/1
  def show
    render json: @tweet
  end

  # POST /tweets
  def create
    @tweet = current_user.tweets.new(tweet_params)

    if @tweet.save
      render json: current_user, serializer: UserWithTweetsSerializer, status: :created
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tweets/1
  def update
    if @tweet.update(tweet_params)
      render json: @tweet
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tweets/1
  def destroy
    @tweet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = current_user.tweets.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tweet_params
      params.permit(:body)
    end
end
