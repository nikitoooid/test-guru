module ApplicationHelper
  def current_year
    Date.today.year
  end

  def github_url(author, repo)
    "#{author} #{link_to 'TestGuru', repo}".html_safe
  end

  def flash_messages
    content_tag :p, flash[:alert], class: 'flash alert' if flash[:alert]
  end
end
