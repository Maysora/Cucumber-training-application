Feature: Remove Note
  In order to find important notes faster
  As a visitor
  I want to remove existing note
  So I only have important notes

  Scenario: Delete a note
    Given I have the following notes:
      | title     | content               |
      | outdated  | dududu dadada ulalala |
      | important | lorem ipsum dolololol |
    And I am on the home page
    When I follow "outdated"
    And I follow "Delete"
    Then I should be on the home page
    And I should not see "outdated"
    But I should see "important"