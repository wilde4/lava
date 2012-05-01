When /^I complete the details for adding a element$/ do
  fill_in :name, :with => "My Element"
end

When /^I follow "([^"]*)" for the "([^"]*)" element$/ do |label, name|
  m = Lava::Element.first(:conditions => {:name => name})
  within(:xpath, "id('element_#{m.id}')") do
    click_link "#{label}"
  end
end