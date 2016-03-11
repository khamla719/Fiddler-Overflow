get '/users/new' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    redirect "/users/#{@user.id}"
  else
    erb :register
  end
end

post '/users/new' do
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
  @user.password = params[:password_plaintext]
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :register
  end
end

get '/users/:id' do
  @logged_in_as = User.find(session[:user_id]) if session[:user_id]
  @viewing_user = User.find(params[:id])
  @comments = Comment.where(user_id: @logged_in_as.id)
  @answers = Answer.where(user_id: @logged_in_as.id)
  @questions = @logged_in_as.questions

  if @logged_in_as && @logged_in_as.id == @viewing_user.id
    erb :'users/show'
  else
    erb :not_authorized
  end
end
