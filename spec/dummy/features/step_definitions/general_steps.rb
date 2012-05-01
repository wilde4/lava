When /^I leave "([^\"]*)" blank$/ do |field|
  fill_in(field, :with => nil)
end

When /^I submit the form$/ do
  click_button("Save")
end
