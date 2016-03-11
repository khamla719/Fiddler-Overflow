get '/users/new' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    redirect "/users/#{@user.id}"
  else
    erb :"users/new"
  end
end

post '/users' do
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
  @user.password = params[:password_plaintext]
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :"users/new"
  end
end

get '/users/:id' do
  @logged_in_as = User.find(session[:user_id]) if session[:user_id]
  @viewing_user = User.find(params[:id])

  if @logged_in_as && @logged_in_as.id == @viewing_user.id
    erb :"users/show"
  else
    erb :not_authorized
  end
end
