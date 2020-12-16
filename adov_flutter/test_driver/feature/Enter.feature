Feature: Enter
    As a User I want to Enter the app

    Scenario: Normal
        Given I'm in "Welcome_Screen" page
        When I tap the "Welcome_Screen" widget
        Then I expect to be in "Home_Screen" page