# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Ebookfinder::Application.initialize!

Amazon::Ecs.options = {
  associate_tag: ENV['AMAZON_ASSOCIATE_TAG'],
  AWS_access_key_id: ENV['AMAZON_ACCESS_KEY_ID'],
  AWS_secret_key: ENV['AMAZON_SECRET_ACCESS_KEY'],
  country: 'jp',
}

