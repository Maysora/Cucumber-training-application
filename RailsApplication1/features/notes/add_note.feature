Feature: Add Note
  In order to have important notes saved safely
  As a visitor
  I want to add a new note

  Scenario: Going to new note page
    Given I am on the home page
    When I follow "Add new note"
    Then I should be on the new note page

  Scenario: Adding new note
    Given I have 0 note
    And I am on the new note page
    When I fill in "Title" with "new note"
    And I fill in "Content" with "Lorem Ipsum Dolololol"
    And I press "Submit"
    Then I should have 1 note
    And I should be on the "new note" note page