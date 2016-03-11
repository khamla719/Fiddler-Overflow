get '/questions' do
  @questions = Question.all

  # redirect '/sessions/new' unless session[:user_id]
  erb :index
end

get '/questions/:id' do

  @question = Question.find_by(id: params[:id])
  erb :"questions/show"
end

