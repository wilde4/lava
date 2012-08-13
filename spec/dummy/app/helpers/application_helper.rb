module ApplicationHelper
  
  def add_markup(value)
    # Custom add_markup method should be included
    # in your project.  This will likely also include
    # widget replacement codes and a markup converter.
    
    value.split("\n").map{|p| "<p>#{p}</p>" if p.present? }.join("") rescue value
  end
  
end
