When /^I follow "([^"]*)" of #{capture_model}(?: with #{capture_fields})?$/ do |link, model, fields|
  model = fetch_model!(model, fields)
  within("[id=\"#{model.class.name.downcase}_#{model.id}\"]") do
    When "I follow \"#{link}\""
  end
end

Then /^I should see the following errors?:$/ do |table|
  table.raw.flatten.each do |error_msg|
    within('div#error_explanation ul') do
      Then "I should see \"#{error_msg}\""
    end
  end
end

Then /^I (should|should not) see "([^"]*)" (field|button|link)$/ do |result, field, object|
  first(:xpath, XPath::HTML.send(object, field)).send(result.sub(' ', '_'), be_present)
end

Then /^I (should|should not) see "([^"]*)" (field|button|link) of #{capture_model}(?: with #{capture_fields})?$/ do |result, field, object, model, attributes|
  model = fetch_model!(model, attributes)
  within("[id=\"#{model.class.name.downcase}_#{model.id}\"]") do
    Then "I #{result} see \"#{field}\" #{object}"
  end
end