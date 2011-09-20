Feature: Delete message
  In order to have clean write board
  As a member
  I need to delete my message

  Background:
    Given an user exists
    And I signed in as the user

  Scenario: Delete own message
    Given I as an author have a message with content: "Hello World"
    And I go to the home page
    When I follow "Delete" of the message
    Then I should not see "Hello World"
    And the message should not exist

  Scenario: Try to delete other's message
    Given another user exists
    And that user as an author have a message with content: "Other Message"
    When I go to the home page
    Then I should not see "Delete" link of the message