Feature: List Notes
  In order to see important notes
  As a visitor
  I want to view all notes title
  so I can explore all notes easily
  
  Scenario: Viewing home page with some notes
    Given I have 3 notes
    When I go to the home page
    Then I should see 3 notes title

  Scenario: Viewing home page without any notes
    Given I have 0 note
    When I go to the home page
    Then I should see "No notes exist"