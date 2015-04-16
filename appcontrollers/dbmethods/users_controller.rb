
get '/users' do 
  
end

get '/users/new' do 
  
end

get '/reports' do 
	@users = User.all
	erb :reports
end

post '/users/create' do 
	@pass = params[:pass]
	if @pass = 'cursameregister'
		@user = User.create(name: params[:name], token_user: params[:token_user])
		session[:notice] = "Usuario agregado correctamente"
	    else
	    session[:notice] = "No ha podido ser creado el usuario"
	end
	redirect '/'
end



