Feature: Member Sign in
  In order to fully utilize message functions
  As a registered member
  I need to sign in

  Scenario: Accessing sign in page
    Given I am on the home page
    When I follow "Sign in"
    Then I should be on the sign in page

  Scenario: Sign in using valid information
    Given an user exists with email: "aya@seiyuu.test", password: "123456"
    And I am on the sign in page
    When I fill in "Email" with "aya@seiyuu.test"
    And I fill in "Password" with "123456"
    And I press "Sign in"
    Then I should be on the home page
    And I should see "Signed in successfully"
    And I should be signed in

  Scenario: Sign in using invalid information
    Given an user exists with email: "aya@seiyuu.test", password: "123456"
    And I am on the sign in page
    When I fill in "Email" with "aya@seiyuu.test"
    And I fill in "Password" with "1234567"
    And I press "Sign in"
    Then I should see "Invalid email or password"
    And I should not be signed in
