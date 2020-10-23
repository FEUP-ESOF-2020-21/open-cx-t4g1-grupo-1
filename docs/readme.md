# openCX-cx-t4g1-grupo-1 Development Report
 
Welcome to the documentation pages of the AdOv of **openCX**!

* Business modeling 
  * [Product Vision](#Product-Vision)
  * [Elevator Pitch](#Elevator-Pitch)
* Requirements
  * [Use Case Diagram](#Use-case-diagram)
  * [User stories](#User-stories)
  * [Domain model](#Domain-model)
* Architecture and Design
  * [Logical architecture](#Logical-architecture)
  * [Physical architecture](#Physical-architecture)
  * [Prototype](#Prototype)
* [Implementation](#Implementation)
* [Test](#Test)
* [Configuration and change management](#Configuration-and-change-management)
* [Project management](#Project-management)


## Team Members

- André Daniel Alves Gomes - up201806224
- Catarina Justo dos Santos Fernandes - up201806610
- Fabio Miguel Chen Huang - up201806829
- Gonçalo André Carneiro Teixeira - up201806562
- Luís Filipe Sousa Teixeira Recharte - up201806743

---

## Product Vision

**A Simple and User Friendly App to provide the best possible hourly organization and adaptation to timetable changes**

---
## Elevator Pitch
Has it ever happened to you getting to a session and finding out it was postponed?
Our app, **AdOv**, allows you to check the event schedule and it gives the staff the opportunity to change it in case of a setback, sending a notification to every user on the conference.
Enjoy the extra minutes of coffee break while still showing up on time to the next lecture! (lecture ou talk ou session ou meeting)

---
## Requirements

### Use case diagram 

![](https://i.imgur.com/52w7pDm.png)

**Check Agenda**
* **Actor**. Atendee
* **Description**. The Atendee can check the conference's agenda 
* **Preconditions and Postconditions**.The Atendee needs to go to the agenda page from a Menu

* **Normal Flow**. 
  * The Atendee goes to the Agenda page
  * The System fetches the most recent data
  * The System display the data

* **Alternative Flows and Exceptions**. Document other, legitimate usage scenarios that can take place within this use case, stating any differences in the sequence of steps that take place. In addition, describe any anticipated error conditions that could occur during execution of the use case, and define how the system is to respond to those conditions. 

### User stories
**List**:
1. As a conference attendee, I want to know when a talk is starting later so that I can enjoy a few more minutes of coffee break.
2. As an online conference attendee, I want to know as soon as possible if a talk has been postponed or if the room has changed so that I can better fit the conference activities into my work-from-home schedule.
3. As an app user i would like to see the updated conference timetable in a specific section of the app.
4. As an app user i would like to have a preview of all of the conference information in a not so detailed manner.
5. As a conference host, I want to have the opportunity to reschedule a talk when a problem happens and still be able to inform the attendees about that change.
6. As a conference host, I want to have the opportunity to change a talk’s room when I need to, and still notify the conference attendees about that change in time.

#### **Story #1**
*As a conference attendee, I want to know when a talk is starting later so that I can enjoy a few more minutes of coffee break*
#### MockUp
![schedule notification](https://i.imgur.com/Ky8q6lo.png)
#### Acceptance Test
```gherkin
Given I want to be notified for changes,
When I unlock my phone,
Then I can read the notification.
```
#### Value
High/Medium/Low
#### Effort
> To Fill

#### **Story #2**
*As an online conference attendee, I want to know as soon as possible if a talk has been postponed or if the room has changed so that I can better fit the conference activities into my work-from-home schedule.*
#### MockUp
![place notification](https://i.imgur.com/ZEwQPfh.png)
#### Acceptance Test
```gherkin
Given I want to be notified for changes,
When I unlock my phone,
Then I can read the notification.
```
#### Value
High/Medium/Low
#### Effort
> To Fill

#### **Story #3**
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
High/Medium/Low
#### Effort
> To Fill

#### **Story #4**
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
High/Medium/Low
#### Effort
> To Fill

#### **Story #5**
*As a conference host, I want to have the opportunity to reschedule a talk when a problem happens and still be able to inform the attendees about that change.*
#### MockUp
> Menu de mudar talk informations
#### Acceptance Test
```gherkin
Given I want to reschedule a talk,
When enter the app as a host,
Then I can change the talk information.
```
#### Value
High/Medium/Low
#### Effort
> To Fill

#### **Story #6**
*As a conference host, I want to have the opportunity to change a talk’s room when I need to, and still notify the conference attendees about that change in time.*
#### MockUp
> Menu de mudar talk informations
#### Acceptance Test
```gherkin
Given I want to change the talk's room,
When enter the app as a host,
Then I can change the talk information.
```
#### Value
High/Medium/Low
#### Effort
> To Fill


### Domain model

---

## Architecture and Design


### Logical architecture


### Physical architecture


### Prototype

---

## Implementation

---
## Test


---
## Configuration and change management


---

## Project management

  * [Github Projects](https://github.com/FEUP-ESOF-2020-21/open-cx-t4g1-grupo-1/projects/2)
  * [Github Issues](https://github.com/FEUP-ESOF-2020-21/open-cx-t4g1-grupo-1/issues)

---

## Evolution - contributions to open-cx
