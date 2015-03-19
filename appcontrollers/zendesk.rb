############# zendesk ##############
require 'zendesk_api'
puts "<><><><><><><>O< loading zendesk tikets"

$zendesk = ZendeskAPI::Client.new do |config|
  # Mandatory:

  config.url = "https://cursame.zendesk.com/api/v2" 

  # Basic / Token Authentication
  config.username = "fernanda@cursa.me"

  # Choose one of the following depending on your authentication choice
  config.token = "hvTm0pvOiXcveHc8mH1Q1BVSJwYky6av7nGguJS1"
  config.password = "tzn210280"

end



