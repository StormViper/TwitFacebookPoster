require_relative 'post_config.rb'
require 'twitter'
require 'koala'
class Poster < PosterConfig


def initialize
  PosterConfig.new
  @@data = return_data

  if @@data["name"].downcase == "Facebook".downcase
    run_facebook_intro(@@data)
  elsif @@data["name"].downcase == "Twitter".downcase
    run_twitter_intro(@@data)
  else
    p "UNKNOWN ERORR| PLEASE CONTACT AN ADMIN"
    return
  end
end

def run_facebook_intro(facebook)
  p "WE'RE INSIDE RUN_FACEBOOK_INTRO"
  graph = Koala::Facebook::API.new(facebook["oauth_access_token"]);
  p "What do you want to post to your wall?"
  input = gets.chomp

  graph.put_connections("me", "feed", message: input)
end

def run_twitter_intro(twitter)
  p "WE'RE INSIDE RUN_TWITTER_INTRO"
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = @@data["consumer_key"]
  config.consumer_secret     = @@data["consumer_secret"]
  config.access_token        = @@data["access_token"]
  config.access_token_secret = @@data["access_secret"]
end

p = "Please input your message to tweet!"
message = gets.chomp

client.update(message)
end

end

Poster.new
