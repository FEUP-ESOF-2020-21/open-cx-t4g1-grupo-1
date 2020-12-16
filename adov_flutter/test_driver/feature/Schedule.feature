Feature: Login
  As an app user i would like to see the updated conference timetable in a specific section of the app.

  Scenario: See Timetable
    Given I'm in "Welcome_Screen" page
    When I tap the "Welcome_Screen" widget
    Then I expect to be in "Home_Screen" page
    When I open the drawer
    And I tap the "scheduleButton" button
    Then I expect to be in "Schedule_Screen" page