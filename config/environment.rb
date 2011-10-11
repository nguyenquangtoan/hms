# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Hms::Application.initialize!

Hms::Application.configure do
  config.time_zone = +7
end


