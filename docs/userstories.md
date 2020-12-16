List:
1. As a conference attendee, I want to know as soon as possible when a talk was postponed so that I can enjoy a few more minutes of coffee break, or so that I can better fit the conference activities into my work-from-home schedule.
2. As a conference attendee, I want to know as soon as possible if there is a change in a talk location.
3. As an app user i would like to see the updated conference timetable in a specific section of the app.
4. As an app user i would like to have a preview of all of the conference information in a not so detailed manner.
5. As a conference host, I want to have the opportunity to reschedule a talk when a problem happens and still be able to inform the attendees about that change.
6. As a conference host, I want to have the opportunity to change a talk’s room when I need to, and still notify the conference attendees about that change in time.
7. As an app user i would like to know all of the details about a talk.
8. As a conference host, I want to to be able to send a notification when i make changes to a talk location.
9. As a conference host, I want to to be able to send a notification when my talk needs to be postponed.
10. As an app user i want to be presented with a welcoming initial screen and sign in as a guest to see all information about the conference.
11. As an app user i want to be presented with a welcoming initial screen and sign in as a staff member in order to reschedule talks and change talk locations when needed.
12. As an app user i want to be presented with information about the conference that i am attending.
13. As an app user i want to be presented with information about the next event that is happening on the conference without consulting the timetable.
14. As a conference host i want to be able to add a talk to the conference
15. As a conference host i want to be able to remove a talk from the conference


## **Story #1**
*As a conference attendee, I want to know as soon as possible when a talk was postponed so that I can enjoy a few more minutes of coffee break, or so that I can better fit the conference activities into my work-from-home schedule.*
#### MockUp
![schedule notification](https://i.imgur.com/Ky8q6lo.png)
#### Acceptance Test
```gherkin
Given I want to be notified for schedule changes,
When I unlock my phone,
Then I can read the notification.
```
## Value
Must Have
#### Effort
S

## **Story #2**
*As a conference attendee, I want to know as soon as possible if there is a change in a talk location.*
#### MockUp
![location notification](https://i.imgur.com/RzdrNdw.png)
#### Acceptance Test
```gherkin
Given I want to be notified for location changes,
When I unlock my phone,
Then I can read the notification.
```
## Value
Must Have
#### Effort
S

## **Story #3**
*As an app user i would like to see the updated conference timetable in a specific section of the app.*
#### MockUp
![timetable interface](https://i.imgur.com/2zuKXjX.png)
#### Acceptance Test
```gherkin
Given I want to know the updated schedule,
When enter the timetable section of the app,
Then I can see the see the updated schedule.
```
#### Value
Must Have
#### Effort
XL

## **Story #4**
*As an app user i would like to have a preview of all of the conference information in a not so detailed manner.*
#### MockUp
![timetable interface](https://i.imgur.com/2zuKXjX.png)
#### Acceptance Test
```gherkin
Given I want to know the conference information,
When enter the timetable section of the app,
Then I can see the see the conference information.
```
#### Value
Must Have
#### Effort
M

## **Story #5**
*As a conference host, I want to have the opportunity to reschedule a talk when a problem happens and still be able to inform the attendees about that change.*
#### MockUp
**No MockUp**
#### Acceptance Test
```gherkin
Given I want to reschedule a talk,
When enter the app as a host,
Then I can change the talk information.
```
#### Value
Must Have
#### Effort
M

## **Story #6**
*As a conference host, I want to have the opportunity to change a talk’s room when I need to, and still notify the conference attendees about that change in time.*
#### MockUp
**No MockUp**
#### Acceptance Test
```gherkin
Given I want to change the talk's room,
When enter the app as a host,
Then I can change the talk information.
```
#### Value
Must Have
#### Effort
M

## **Story #7**
*As an app user i would like to know all of the details about a talk.*
#### MockUp
![Talk details](https://i.imgur.com/36GnPjP.png)
#### Acceptance Test
```gherkin
Given I want to know details about a talk,
When enter any talk details section of the app,
Then I can see the details about a specific talk.
```
#### Value
Should Have
#### Effort
S

## **Story #8**
*As a conference host, I want to to be able to send a notification when i make changes to a talk location.*
#### MockUp
**No MockUp**
#### Acceptance Test
```gherkin
Given I want to notify for room changes,
When I make changes to a talk location,
Then I can have everyone notified.
```
#### Value
Should Have
#### Effort
S

## **Story #9**
*As a conference host, I want to be able to send a notification when my talk needs to be postponed.*
#### MockUp
**No MockUp**
#### Acceptance Test
```gherkin
Given I want to notify for schedule changes,
When I make changes to a talk schedule,
Then I can have everyone notified.
```
#### Value
Should Have
#### Effort
S

## **Story #10**
*As an app user i want to be presented with a welcoming initial screen and sign in as a guest to see all information about the conference*
#### MockUp
![Initial screen](https://i.imgur.com/9CbxNQq.png)
#### Acceptance Test
```gherkin
Given I want to sign in as a guest,
When I enter the app,
Then I can see informations about the conference.
```
#### Value
Must Have
#### Effort
M

## **Story #11**
*As an app user i want to be presented with a welcoming initial screen and sign in as a staff member in order to reschedule talks and change talk locations when needed.*
#### MockUp
![Initial screen](https://i.imgur.com/9CbxNQq.png)
#### Acceptance Test
```gherkin
Given I want to sign in as a staff member,
When I enter the app,
Then I can change informations about the conference.
```
#### Value
Must Have
#### Effort
L

## **Story #12**
*As an app user i want to be presented with information about the conference that i am attending.*
#### MockUp
![Home page](https://i.imgur.com/XNZCGYs.png)
#### Acceptance Test
```gherkin
Given I want to see conference informations,
When I enter the home page,
Then I can know more about what i am going to attend.
```
#### Value
Should Have
#### Effort
M

## **Story #13**
*As an app user i want to be presented with information about the next event that is happening on the conference without consulting the timetable.*
#### MockUp
![Home page](https://i.imgur.com/XNZCGYs.png)
#### Acceptance Test
```gherkin
Given I want to see the next event,
When I enter the home page,
Then I can easily know what is the next event.
```
#### Value
Should Have
#### Effort
M

## **Story #14**
*As a conference host i want to be able to add a talk to the conference*
#### MockUp
![Home page](https://i.imgur.com/2Mt4vwB.jpg)
#### Acceptance Test
```gherkin
Given I want to add a talk to the conference,
When I press the + floating button,
Then I can fill in the details and add a talk.
```
#### Value
Should Have
#### Effort
L

## **Story #15**
*As a conference host i want to be able to delete a talk from the conference*
#### MockUp
**No MockUp**
#### Acceptance Test
```gherkin
Given I want to delete a talk from the conference,
When I select a specific talk as a conference organizer,
Then I can delete that talk.
```
#### Value
Should Have
#### Effort
S
