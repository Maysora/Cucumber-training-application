When /^I signed in(?: as #{capture_model})?(?: with #{capture_fields})?$/ do |user, fields|
  user = fetch_model(user) unless user.nil?
  fields = parse_fields(fields)
  email = user.try(:email) || fields["email"] || FactoryGirl.attributes_for(:user)[:email]
  password = fields["password"] || FactoryGirl.attributes_for(:user)[:password]
  Given "I am on the sign in page"
  When "I fill in the following:", table(%{
    | Email    | #{email}    |
    | Password | #{password} |
  })
  And "I press \"Sign in\""
end

Then /^I (should|should not) be signed in$/ do |result|
  Then "I #{result} see \"Sign out\""
end