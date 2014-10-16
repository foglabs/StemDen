# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ENV["REDISTOGO_URL"] = redis://redistogo:b1516a790321f74884b90a7d817045c7@greeneye.redistogo.com:10208/
