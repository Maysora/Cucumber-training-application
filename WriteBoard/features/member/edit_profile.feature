Feature: Edit member profile
  In order to have up to date identification
  As a member
  I need to edit my profile

  Background:
    Given an user exists with email: "aya@seiyuu.test", password: "password"
    And I signed in as the user with password: "password"

  Scenario: Accessing edit profile page
    Given I am on the home page
    When I follow "Edit Profile"
    Then I should be on the edit profile page

  Scenario: Change to valid email
    Given I am on the edit profile page
    When I fill in "Email" with "yui@singer.test"
    And I press "Update"
    Then I should see "Profile updated"
    And I should be on the home page
    And an user should exist with email: "yui@singer.test"

  Scenario: Change to invalid email
    Given I am on the edit profile page
    When I fill in "Email" with ""
    And I press "Update"
    Then I should see the following error:
      | Email can't be blank |

  Scenario: Change to valid password using valid old password
    Given I am on the edit profile page
    When I fill in "Old Password" with "password"
    And I fill in "New Password" with "new password"
    And I fill in "New Password Confirmation" with "new password"
    And I press "Update"
    Then I should be on the home page
    And I should see "Profile updated"
    And my current password should be "new password"

  Scenario: Change to invalid password using invalid old password
    Given I am on the edit profile page
    When I fill in "Old Password" with "wrong password"
    And I fill in "New Password" with "short"
    And I fill in "New Password Confirmation" with "different password"
    And I press "Update"
    Then my current password should be "password"
    And I should see the following errors:
      | Current password is invalid                     |
      | Password doesn't match confirmation             |
      | Password is too short (minimum is 6 characters) |
