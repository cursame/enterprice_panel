############ mix panel ##########
require 'mixpanel_client'
mixpanel_api_key = '01e6ae913ad70076648895625d3b1ad4'
mixpanel_api_secret = 'ede7320e033116a0292903a5c451887f'
mixpanel_token  = 'd464856986d17876b15d31a6700fb620'
mixpanel_url = "https://data.mixpanel.com"
this_today = "#{Date.today}"
last_mont_date = "#{Date.today.prev_month}"
puts last_mont_date

client = Mixpanel::Client.new(
  api_key:    mixpanel_api_key, 
  api_secret: mixpanel_api_secret
)

$data = client.request(
  'events/properties',
  event:     'Logins',
  name:      'Logins',
  type:      'unique',
  unit:      'day',
  from_date: last_mont_date,
  to_date:   this_today,
  limit:     100
)

puts "<><><><><><><>O< loading mix panel logins"
puts $data["data"]["values"]["undefined"]
