Then /^I should see (\d+) messages$/ do |count|
  page.should have_selector('div#messages_container > div[id^="message_"]', :count => count.to_i)
end