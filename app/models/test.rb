class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_and_belongs_to_many :users
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  def self.titles_by_category(category_name)
    joins(:category).where(category: { title: category_name }).pluck(:title).sort
  end
end
