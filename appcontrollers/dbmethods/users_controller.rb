
get '/users' do 
  
end

get '/users/new' do 
  
end

post '/users/create' do 
	@user = User.create(name: params[:name], token_user: params[:token_user])
	redirect '/'
end



