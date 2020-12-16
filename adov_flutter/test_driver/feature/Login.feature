  Feature: Login
    As an user, I want to be able to login to the app, so that I can use all the available features.

    Scenario: Login with invalid e-mail format
        Given I'm in "Welcome_Screen" page
        When I tap the "Login_Button" button
        Then I expect to be in "Login_Screen" page
        And I have "emailField" and "passwordField" and "signInButton"
        When I fill the "emailField" field with "notanemail"
        And I fill the "passwordField" field with "adminadov"
        When I tap the "signInButton" button
        Then I expect the "warning" to be "Invalid Email Format"
        Then I expect to be in "Login_Screen" page

    Scenario: Login with non existant user
        Given I'm in "Welcome_Screen" page
        When I tap the "Login_Button" button
        Then I expect to be in "Login_Screen" page
        And I have "emailField" and "passwordField" and "signInButton"
        When I fill the "emailField" field with "notauser@adov.com"
        And I fill the "passwordField" field with "userpassword"
        When I tap the "signInButton" button
        Then I expect the "warning" to be "User Not Found"
        Then I expect to be in "Login_Screen" page

    Scenario: Login with wrong password
        Given I'm in "Welcome_Screen" page
        When I tap the "Login_Button" button
        Then I expect to be in "Login_Screen" page
        And I have "emailField" and "passwordField" and "signInButton"
        When I fill the "emailField" field with "admin@adov.com"
        And I fill the "passwordField" field with "wrongpassword"
        When I tap the "signInButton" button
        Then I expect the "warning" to be "Wrong Password"
        Then I expect to be in "Login_Screen" page

    Scenario: Login successful
        Given I'm in "Welcome_Screen" page
        When I tap the "Login_Button" button
        Then I expect to be in "Login_Screen" page
        And I have "emailField" and "passwordField" and "signInButton"
        When I fill the "emailField" field with "admin@adov.com"
        And I fill the "passwordField" field with "adminadov"
        When I tap the "signInButton" button
        Then I expect the "warning" to be "Successfully Logged In"
        And I pause for 2 seconds
        Then I expect to be in "Home_Screen" page