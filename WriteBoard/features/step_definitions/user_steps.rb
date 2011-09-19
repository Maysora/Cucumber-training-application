Then /^#{capture_model} current password should be "([^"]*)"$/ do |user, password|
  user = find_model!(user)
  user.should be_valid_password password
end