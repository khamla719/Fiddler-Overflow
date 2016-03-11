require 'faker'

User.delete_all

#create 10 dummy users
users = 10.times.map do
  User.create!( :first_name => Faker::Name.first_name,
                :last_name  => Faker::Name.last_name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end

answer = Answer.create(body: Faker::Hacker.say_something_smart, user_id: 1, question_id: 1)
question = Question.create(title:Faker::Hacker.noun,body:Faker::Hacker.say_something_smart ,user_id:1)
comment = Comment.create(body: Faker::Hipster.sentence, user_id: 1,commentable: question)
votes = Vote.create(positive: true, user_id: 1,votable: answer)

