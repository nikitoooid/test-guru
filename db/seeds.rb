Answer.delete_all
Question.delete_all
User.delete_all
Test.delete_all
Category.delete_all

categories = Category.create!([
  {title: 'Ruby'},
  {title: 'RoR'}
])

tests = Test.create!([
  {title: 'Ruby beginner', level: 0, category_id: categories[0].id},
  {title: 'Ruby intermediate', level: 1, category_id: categories[0].id},
  {title: 'Ruby pro', level: 2, category_id: categories[0].id},
  {title: 'Rails beginner', level: 0, category_id: categories[1].id},
  {title: 'Rails intermediate', level: 1, category_id: categories[1].id},
  {title: 'Rails pro', level: 2, category_id: categories[1].id}
])

questions = Question.create!([
  {body: 'Question for Ruby beginner', test_id: tests[0].id},
  {body: 'Question for Ruby intermediate', test_id: tests[1].id},
  {body: 'Question for Ruby pro', test_id: tests[2].id},
  {body: 'Question for Rails beginner', test_id: tests[3].id},
  {body: 'Question for Rails intermediate', test_id: tests[4].id},
  {body: 'Question for Rails pro', test_id: tests[5].id}
])

users = User.create!([
  {name: 'Ivan'},
  {name: 'John Doe'}
])

users.each do |user|
  user.answers.create([
    {body: "Test answer for Ruby beginner by #{user.name}", question_id: questions[0].id},
    {body: "Test answer for Ruby intermediate by #{user.name}", question_id: questions[1].id},
    {body: "Test answer for Ruby pro by #{user.name}", question_id: questions[2].id},
    {body: "Test answer for Rails beginner by #{user.name}", question_id: questions[3].id},
    {body: "Test answer for Rails intermediate by #{user.name}", question_id: questions[4].id},
    {body: "Test answer for Rails pro by #{user.name}", question_id: questions[5].id}
  ])

  2.times do
    random_test = tests.sample
    user.tests << random_test unless user.tests.exists?(id: random_test.id)
  end
end


p "Created #{Category.count} categories"
p "Created #{Test.count} tests"
p "Created #{Question.count} questions"
p "Created #{User.count} users"
p "Created #{Answer.count} answers"