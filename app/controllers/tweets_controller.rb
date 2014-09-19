class TweetsController < ApplicationController

  before_action :authenticate, only:[:new,:create,:edit,:update,:destroy]

  def show
    @tweet=Tweet.find(params[:id])
    @replies = @tweet.replies.includes(:reply_tweet)
  end

  def new
    @user=User.cached_find(params[:user_id])
    @tweet=Tweet.new
    @path=[@user,@tweet]
  end

  def create
    @user=User.cached_find(params[:user_id])
    @tweet = @user.tweets.new(content: tweet_params[:content])
    if @tweet.save!
      redirect_to tweet_path(@tweet), notice: "Successfully created!"
    else
      @path=[@user,@tweet]
      flash[:notice]="Please correct the following errors: \n Tweet is too long."
      redirect_to root_path
    end
  end

  def favorite
    @tweet=Tweet.find(params[:tweet_id])
    current_user.favorite(@tweet)
    redirect_to @tweet, notice: 'favorited'
  end

  def unfavorite
    @tweet=Tweet.find(params[:tweet_id])
    current_user.unfavorite(@tweet)
    redirect_to @tweet, notice: 'unfavorited'
  end

  def retweet
    @tweet=Tweet.find(params[:tweet_id])
    current_user.retweet(@tweet)
    redirect_to @tweet, notice: 'retweeted'
  end

  def undo_retweet
    @tweet=Tweet.find(params[:tweet_id])
    current_user.undo_retweet(@tweet)
    redirect_to @tweet, notice: 'undid retweeted'
  end

  def reply
    original_tweet = Tweet.find(params[:tweet_id])
    new_tweet = current_user.tweets.new(content: params[:content])
    if new_tweet.save
      Reply.create!(original_tweet_id: original_tweet.id, reply_tweet_id: new_tweet.id)
      redirect_to original_tweet, notice: "succesful meow back, let's hope #{original_tweet.user.username} can handle it."
    else
      redirect_to original_tweet, notice: "Please correct the following errors: \n Tweet is too long"
    end
  end

  def destroy
    @tweet=Tweet.find(params[:id])
    @user=@tweet.user
    @tweet.destroy
    redirect_to @user
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
