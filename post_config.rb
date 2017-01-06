class PosterConfig

def initialize
  run
end

def run
  p "Welcome the the poster"
  p "Please select a service: Facebook or Twitter(1 or 2)"
  choice = gets.chomp.to_i

  if choice == 1
    service_name = "Facebook"
  elsif choice == 2
    service_name = "Twitter"
  else
    p "ERROR Please try again"
    run
  end
  if service_name == "Facebook"
    get_facebook_details(service_name)
  elsif service_name == "Twitter"
    get_twitter_details(service_name)
  else
    "ERROR: RESTARTING"
  end
end

def get_facebook_details(service_name)
  return if service_name.downcase != "facebook".downcase
  p "Please enter your oauth access_token | MAKE SURE THESE ARE CORRECT"
  oauth_access_token = gets.chomp
  @@data = {"name" => service_name, "oauth_access_token" => oauth_access_token}
end

def get_twitter_details(service_name)
  return if service_name.downcase != "twitter".downcase
  p "Please enter your twitter consumer key | MAKE SURE THESE ARE CORRECT"
  consumer_key = gets.chomp
  p "Please enter your twitter consumer secret | MAKE SURE THESE ARE CORRECT"
  consumer_secret = gets.chomp


  p "Please enter your twitter access token | MAKE SURE THESE ARE CORRECT"
  access_token = gets.chomp
  p "Please enter your twitter access secret | MAKE SURE THESE ARE CORRECT"
  access_secret = gets.chomp

  @@data = {"name" => service_name, "consumer_key" => consumer_key, "consumer_secret" => consumer_secret, "access_token" => access_token, "access_secret" => access_secret}
end

def return_data
  return @@data
end

end
