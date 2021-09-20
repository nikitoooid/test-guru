class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :created_tests, class_name: 'Test'

  validates :email, presence: true

  def tests_by_level(level)
    self.tests.by_level(level)
  end
end
