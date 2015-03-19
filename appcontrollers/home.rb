########## home controller to define and active panell ########
require './appcontrollers/zendesk'
require './appcontrollers/mixpanel'
puts "home controller"
get '/' do 
   @tickets = $zendesk.tickets.recent
   mix_loggins_conplex = []
   mix = $data
   mix_series = $data["data"]["series"] 
   mix_poll = $data["data"]["values"]["undefined"]
     
     mix_series.each do |mi|
       mix_loggins_conplex.push( mix_poll[mi] ) 
     end
   @single_date = mix_series
   @mix = mix_loggins_conplex
   puts "<><><><><><><><><<<<<<<<<< render panel.haml"
   haml :panel
end
