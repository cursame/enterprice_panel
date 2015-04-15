########## home controller to define and active panell ########

puts "home controller"
get '/' do 

  @notice = session[:notice]

  puts '#################################################################'
  puts 'Load pannel from cursame'
  puts '#################################################################'

   require './appcontrollers/zendesk'
   require './appcontrollers/mixpanel'
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
   puts "<><><><><><><><><<<<<<<<<< render panel.erb"
   erb :panel
end

get '/funel_to_do' do 
  puts '#################################################################'
  puts 'Load funel from cursame'
  puts '#################################################################'
  @data_array = "[  ['Requerimientos de ventas', 200], ['Clientes contactados', 1000],  ['Clientes Vendidos', 25]]"
  erb :funel
end
