Feature: Member Sign Up
  In order to have proper identification
  As a visitor
  I need to sign up

  Scenario: Accessing sign up page
    Given I am on the home page
    When I follow "Sign up"
    Then I should be on the sign up page

  Scenario: Sign up using valid information
    Given I am on the sign up page
    When I fill in "Email" with "aya@seiyuu.test"
    And I fill in "Password" with "123456"
    And I fill in "Password confirmation" with "123456"
    And I press "Sign up"
    Then an user should exist with email: "aya@seiyuu.test"
    And I should be on the sign in page
    And I should see "Sign up success"

  Scenario: Sign up using invalid information
    Given I am on the sign up page
    When I fill in "Email" with "invalid_email"
    And I fill in "Password" with "12345"
    And I fill in "Password confirmation" with "11111"
    And I press "Sign up"
    Then an user should not exist with email: "invalid_email"
    And I should see the following errors:
      | Email is invalid                                |
      | Password doesn't match confirmation             |
      | Password is too short (minimum is 6 characters) |