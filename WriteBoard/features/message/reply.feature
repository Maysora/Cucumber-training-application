Feature: Reply message
  In order to converse with other people
  As a member
  I need to reply other's message
# TODO: it might be better to separate these in various features files under reply directory

  Background:
    Given an user exist
    And I signed in as the user
    And I as an author have a message

  Scenario: Accessing reply message page
    Given I am on the home page
    When I follow "Reply" of a message
    Then I should be on the message's reply's new page

  Scenario: Replying a message
    Given I am on the message's reply's new page
    When I fill in "Content" with "Okay!"
    And I press "Reply"
    Then I should be on the home page
    And I should see "Okay!"
    And a reply should exist with content: "Okay!"
    And the reply should be one of the first message's replies

  Scenario: Edit a reply
    Given I as an author have a reply with parent: the message, content: "This is madness!"
    And I am on the home page
    And I follow "Edit" of the reply
    And I fill in "Content" with "Madness?? This.. is.. REPLY!!!"
    And I press "Update"
    Then a reply should exist with content: "Madness?? This.. is.. REPLY!!!"
    And I should not see "This is madness!"

  Scenario: Deleting a reply
    Given I as an author have a reply with parent: the message, content: "Oops dopos"
    And I am on the home page
    And I follow "Delete" of the reply
    Then a reply should not exist with content: "Oops dopos"
    And I should not see "Oops dopos"

  Scenario: Replying a reply
    Given a reply exist with parent: the message
    And I am on the home page
    When I follow "Reply" of the reply
    And I fill in "Content" with "O, RLY?!"
    And I press "Reply"
    Then a reply should exist with content: "O, RLY?!"
    And the 2nd reply should be one of the 1st reply's replies

  Scenario: Deleting a message with reply
    Given a reply exist with parent: the message
    And I am on the home page
    When I follow "Delete" of the first message
    Then 0 messages should exist

  Scenario: Try to reply without signing in
    Given I am not signed in
    When I go to the home page
    Then I should not see "Reply" link

  Scenario: Try to access reply page without signing in
    Given I am not signed in
    When I go to a message's reply's new page
    Then I should be on the sign in page