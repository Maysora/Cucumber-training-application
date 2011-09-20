Feature: Edit message
  In order to communicate properly
  As a member
  I need to edit my message
  so I can fix any mistake in it

  Background:
    Given an user exists
    And I signed in as the user

  Scenario: Accessing edit message page
    Given I as an author have a message with content: "Hello World"
    And I am on the home page
    When I follow "Edit" of the message
    Then I should be on the message's edit page

  Scenario: Change message content
    Given I as an author have a message with content: "Hello World"
    And I am on the message's edit page
    When I fill in "Content" with "New content"
    And I press "Update"
    Then I should be on the home page
    And I should see "New content"
    But I should not see "Hello World"

  Scenario: Try to edit other's message
    Given another user exists
    And that user as an author have a message with content: "Other Message"
    When I go to the home page
    Then I should not see "Edit" link of the message