class SearchesController < ApplicationController

  def combined_search
    @searched_combined = User.searched_users(params[:search_term])
    @searched_combined += Tweet.searched_tweets(params[:search_term])
    if @searched_combined[0]
      render json: @searched_combined
    else
      @error = {error: "I'm sorry, it doesn't look there are any results that match your search term"}
      render json: @error
    end
  end

  def users_search
    @searched_users = User.searched_users(params[:search_term])
    if @searched_users[0]
      render json: @searched_users
    else
      @error = {error: "I'm sorry, it doesn't look there are any results that match your search term"}
      render json: @error
    end
  end

  def tweets_search
    @searched_tweets = Tweet.searched_tweets(params[:search_term])
    if @searched_tweets[0]
      render json: @searched_tweets
    else
      @error = {error: "I'm sorry, it doesn't look there are any results that match your search term"}
      render json: @error
    end
  end

end
