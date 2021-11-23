Answer.delete_all
Question.delete_all
Test.delete_all
# User.delete_all
Category.delete_all

categories = Category.create!([
  {title: 'Ruby'},
  {title: 'RoR'}
])

# users = User.create!([
#   {name: 'Ivan', email: 'test@test.com', password: 'test', password_confirmation: 'test'},
#   {name: 'John Doe', email: 'john@mail.com', password: 'test', password_confirmation: 'test'}
# ])

users = [User.first]

tests = Test.create!([
  {title: 'Ruby beginner', level: 1, category_id: categories[0].id, user_id: users[0].id},
  {title: 'Ruby intermediate', level: 2, category_id: categories[0].id, user_id: users[0].id},
  {title: 'Ruby pro', level: 5, category_id: categories[0].id, user_id: users[0].id},
  {title: 'Rails beginner', level: 1, category_id: categories[1].id, user_id: users[0].id},
  {title: 'Rails intermediate', level: 3, category_id: categories[1].id, user_id: users[0].id},
  {title: 'Rails pro', level: 5, category_id: categories[1].id, user_id: users[0].id}
])

# tests.each do |t|
#   t.questions.create!(body: 'Test question')
# end

# users.each do |user|
#   2.times do
#     random_test = tests.sample
#     user.tests << random_test unless user.tests.exists?(id: random_test.id)
#   end
# end

p "Created #{Category.count} categories"
p "Created #{Test.count} tests"
# p "Created #{User.count} questions"
# p "Created #{User.count} users"