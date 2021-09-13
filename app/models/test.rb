class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_and_belongs_to_many :users

  def self.titles_by_category(category_name)
    joins(:category).where('categories.title = ?', category_name).pluck(:title).sort
  end
end
