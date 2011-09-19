Then /^I should see the following errors?:$/ do |table|
  table.raw.flatten.each do |error_msg|
    within('div#error_explanation ul') do
      Then "I should see \"#{error_msg}\""
    end
  end
end