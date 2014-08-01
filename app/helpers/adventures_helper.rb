module AdventuresHelper
  def nested_adventures(adventures)
    adventures.map do |adventure, sub_adventures|
      render(adventure) + content_tag(:div, nested_adventures(sub_adventures), class: 'nested_adventures')
    end.join.html_safe
  end
end
