class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :by_category, -> (category_title) {
    joins('JOIN categories ON tests.category_id = categories.id').where('categories.title = ?', category_title)
  }
  scope :by_level, -> (level) { where(level: level) }
  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }

  def self.titles_by_category(category_name)
    joins(:category).by_category(category_name).order(title: :desc).pluck(:title)
  end

  def self.ready_to_pass
    joins(:questions).group('id')
  end
end
