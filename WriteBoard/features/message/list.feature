Feature: Message list
  In order to read what other people write
  As a visitor or member
  I want to see message listing

  Background:
    Given 10 messages exist

  Scenario: View all messages while not logged in
    Given I am on the home page
    Then I should see 10 messages

  Scenario: View all messages while logged in
    Given an user exists
    And I signed in as the user
    And I am on the home page
    Then I should see 10 messages