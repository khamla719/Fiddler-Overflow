get '/' do

  erb :index
end

get '/questions' do
  @questions = Question.all

  redirect '/sessions/new' unless session[:user_id]
  erb :question
end
