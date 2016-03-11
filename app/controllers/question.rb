get '/questions' do
  @questions = Question.all

  # redirect '/sessions/new' unless session[:user_id]
  erb :index
end

get '/questions/:id' do

  @question = Question.find_by(id: params[:id])
  erb :"questions/show"
end

post "/questions/:id/voteup" do
  @question = Question.find_by(id: params[:id])
  @question.votes.create(positive: true)
  redirect "/questions/#{@question.id}"
end



post "/questions/:id/votedown" do
  @question = Question.find_by(id: params[:id])
  @question.votes.create(positive: false)
   redirect "/questions/#{@question.id}"
end

