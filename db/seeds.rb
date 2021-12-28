Answer.delete_all
Question.delete_all
Test.delete_all
User.delete_all
Category.delete_all
Badge.delete_all

categories = Category.create!([
  {title: 'Ruby'},
  {title: 'RoR'}
])

badges = Badge.create!([
  {title: 'No rule badge 1', description: 'This badge dont have any rule.', rule: 'no rule'},
  {title: 'No rule badge 2', description: 'This badge dont have any rule.', rule: 'no rule'},
  {title: 'No rule badge 3', description: 'This badge dont have any rule.', rule: 'no rule'}
])

users = User.create!([
  {first_name: 'Ivan', last_name: 'Vanko', email: 'test@test.com', password: 'test123', password_confirmation: 'test123', type: 'Admin'}
])

tests = users[0].created_tests.create!([
  {title: 'Ruby beginner', level: 1, category_id: categories[0].id},
  {title: 'Ruby intermediate', level: 2, category_id: categories[0].id},
  {title: 'Ruby pro', level: 5, category_id: categories[0].id},
  {title: 'Rails beginner', level: 1, category_id: categories[1].id},
  {title: 'Rails intermediate', level: 3, category_id: categories[1].id},
  {title: 'Rails pro', level: 5, category_id: categories[1].id}
])

tests.each do |t|
  t.questions.create!([
    {body: 'Test question 1'},
    {body: 'Test question 2'},
    {body: 'Test question 3'}
  ])
end

Question.all.each do |q|
  q.answers.create!([
    {body: 'Correct answer', correct: true},
    {body: 'Incorrect answer', correct: false},
    {body: 'Incorrect answer 2', correct: false}
  ])
end

p "Created #{Category.count} categories"
p "Created #{User.count} users"
p "Created #{Test.count} tests"
p "Created #{Question.count} questions"
p "Created #{Answer.count} answers"
p "Created #{Badge.count} badges"
