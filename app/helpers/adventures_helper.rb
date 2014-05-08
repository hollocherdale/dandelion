module AdventuresHelper
  def nested_adventures(adventures)
    adventures.map do |adventure, sub_adventures|
      render(adventure) + content_tag(:div, nested_adventures(sub_adventures), :class => "nested_adventures")
    end.join.html_safe
  end

# I want to pass in either choice or story, and have this method display the correct attribute of the post.
  def display_submissions(post)
  	@submissions.each do |submission|
  		submission.choice
  	end
  end
end