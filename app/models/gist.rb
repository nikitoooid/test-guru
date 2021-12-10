class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  EXCERPT_LIMIT = 25

  def excerpt
    question.body.truncate(EXCERPT_LIMIT)
  end

  def hash_url
    url[/gist.github.com\/(\w+)/, 1]
  end

end
