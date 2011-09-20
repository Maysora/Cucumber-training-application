Then /^I should see (\d+) messages$/ do |count|
  within('div#messages_container') do
    page.should have_selector('div[id^="message_"]', :count => count.to_i)
  end
end