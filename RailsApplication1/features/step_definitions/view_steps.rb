When /^I fill in "([^"]*)" with$/ do |field, text|
  fill_in(field, :with => text)
end

Then /^I should see$/ do |text|
  page.text.should include(text)
end

Then /^I should see formatted html$/ do |text|
  page.body.should include(n2br text)
end