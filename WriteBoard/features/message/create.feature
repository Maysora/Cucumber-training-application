Feature: Create message
  In Order to start a conversation
  As a member
  I need to post a message

  Scenario Outline: Create a message with valid and invalid content
    Given an user exists
    And I signed in as the user
    And I am on the home page
    When I fill in "Content" with "<content>"
    And I press "Post"
    Then a message should <existence> with content: "<content>"
    And I should <visibility> "<content>"

    Examples:
      | existence | visibility | content       |
      | exist     | see        | valid message |
      | not exist | not see    | fu            |
      | not exist | not see    | invalid message with content length more than 150 characters long, in fact this content have 1 character differences from valid message which is 151 :P |

  Scenario: Try to create a message without signing in
    Given I am on the home page
    Then I should not see "Content" field
    And I should not see "Post" button