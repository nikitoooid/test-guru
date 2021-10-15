module ApplicationHelper
  def current_year
    Date.today.year
  end

  def github_url(author, repo)
    "#{author} <a href='#{repo}'>TestGuru</a>".html_safe
  end
end
