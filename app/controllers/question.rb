get '/questions' do
  @questions = Question.all

  # redirect '/sessions/new' unless session[:user_id]
  erb :index
end
