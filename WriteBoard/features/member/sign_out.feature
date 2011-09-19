Feature: Member Sign out
  In order to prevent other people using my identification
  As a signed in member
  I need to sign out

  Scenario: Sign out
    Given an user exists
    And I signed in as the user
    And I am on the home page
    When I follow "Sign out"
    Then I should be on the home page
    And I should see "Signed out"
    And I should not be signed in
    And I should not see "Edit Profile"