post '/questions/:id/answers' do

  @question = Question.find_by(id: params[:id])
  @answer = Answer.create(user_id: session[:id], body: params[:body], question_id: params[:id])
  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    redirect '/'
  end

end

