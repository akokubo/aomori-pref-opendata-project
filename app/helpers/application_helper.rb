module ApplicationHelper
  # ページごとの完全なタイトルを返す
  def full_title(page_title)
    base_title = "MapRamble"
    if page_title.empty?
      base_title
    else
      "#{page_title} - #{base_title}"
    end
  end

  def link_to_btn(body, url, html_options = {})
    link_to(body, url, { class: ['ui-btn'] }.merge(html_options))
  end
end
