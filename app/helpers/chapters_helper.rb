module ChaptersHelper
  def nested_chapters(chapters)
    chapters.map do |chapter, sub_chapters|
      render(chapter) + content_tag(:div, nested_chapters(sub_chapters), class: 'nested_chapters')
    end.join.html_safe
  end
end
