get '/check_ins' do 
  
end

get '/check_in/new' do 
  
end

post '/check_in/create' do 
	@user = CheckIn.create(check_in: params[:name], token_user: params[:token_user])
	redirect '/'
end

