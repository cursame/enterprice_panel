get '/check_ins' do 
  
end

get '/check_in/new' do 
  
end

post '/check_in/create' do 
	puts "check in created in #{Time.now}"
	@checkin = CheckIn.create(check_in: Time.now, token_user: params[:token_user])
	puts "se ha creado un checkin"
	puts @checkin.check_in
	puts @checkin.token_user
	session[:notice] = "Se ha registrado correctamte tu ingreso"
	redirect '/'

end

