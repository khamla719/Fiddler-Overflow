post '/questions/:id/comments' do
  @question = Question.find_by(id: params[:id])
  @comment = Comment.create(user_id: session[:id], body: params[:body], commentable_id: @question.id, commentable_type: "Question")
  if @comment.save
    redirect "/questions/#{@question.id}"
  else
    redirect '/'
  end
end

post "/questions/:question_id/answers/:id/comments" do
    @question = Question.find_by(id: params[:question_id])
    @answer = Answer.find_by(id: params[:id])
    @comment = Comment.create(user_id: session[:id], body: params[:body], commentable_id: @answer.id, commentable_type: "Answer")
    if @comment.save
      redirect "/questions/#{@question.id}"
    else
      redirect '/'
    end
end

post "/questions/:question_id/answers/:id/comments/:id/voteup" do

end

post "/questions/:question_id/answers/:id/comments/:id/voteup" do

end
