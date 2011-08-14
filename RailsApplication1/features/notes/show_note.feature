Feature: Show Note
  In order to see saved note content
  As a visitor
  I want to see note details

  Scenario: Viewing a note detail
    Given I have the following note:
      | title      | content          |
      | Speed Star | The second album |
    And I am on the home page
    When I follow "Speed Star"
    Then I should be on the "Speed Star" note page
    And I should see "The second album"