require 'faker'

User.delete_all

#create 10 dummy users
users = 10.times.map do
  User.create!( :first_name => Faker::Name.first_name,
                :last_name  => Faker::Name.last_name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end

answer = Answer.create(body:'test_answers', user_id: 1, question_id: 1)
question = Question.create(title:'test_question',body:'test_question_body' ,user_id:1)
comment = Comment.create(body:'test_comment', user_id: 1,commentable: question)
votes = Vote.create(positive: true, user_id: 1,votable: answer)

