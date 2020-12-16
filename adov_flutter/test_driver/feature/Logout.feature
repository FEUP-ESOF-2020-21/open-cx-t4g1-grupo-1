Feature: Logout
    As an user, I want to be able to logout

    Scenario: Logout
        Given I'm in "Welcome_Screen" page
        When I tap the "Welcome_Screen" widget
        Then I expect to be in "Home_Screen" page
        And I'm logged in and in "Home_Screen"
        When I open the drawer
        And I tap the "logoutButton" button
        Then I expect to be in "Home_Screen" page