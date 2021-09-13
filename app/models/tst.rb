class Test < ApplicationRecord
  has_many :questions
end

class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
end

class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
end

class User < ApplicationRecord
  has_many :answers
  has_many :questions, through: :answers
  has_many :tests, trough: :questions
end




class Test < ApplicationRecord
  has_many :answers
  has_many :users
end

class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
end

class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
end

class User < ApplicationRecord
  has_many :answers
  has_and_belongs_to_many :tests
end



