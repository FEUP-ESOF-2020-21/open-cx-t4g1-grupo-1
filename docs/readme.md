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
* **Preconditions and Postconditions**. The Atendee needs to go to the agenda page from a Menu

* **Normal Flow**. 
  * The Atendee goes to the Agenda page
  * The System fetches the most recent data
  * The System display the data

* **Alternative flows and exceptions**
  * The atendee might want to see the agenda without internet connection, if a talk was changed, the data displayed on the app wont be updated. It will be updated as soon as the atendee turns on the internet

**Check Notifications**
* **Actor**. Atendee

* **Description**. The atendee can receive notifications and be updated without opening the app

* **Preconditions and Postconditions**. The atendee only needs to turn on the phone screen to see the notification

* **Normal Flow**.
  * The system sends a notification describing the change
  * The atendee turns on the phone screen and sees the updates

* **Alternative flows and exceptions**
  * The atendee can tap on the notification to automatically enter the app and see more detailed information. The notification wont be received if the user doesnt have internet connection but will be as soon as he turns it on

**Reschedule Talk**

* **Actor**. Conference host

* **Description**. The conference host can send a notification to the atendees when reshedules a talk

* **Preconditions and Postconditions**. The conference host needs to sign in as a staff member and go to the edit talks tab, reschedule the talk, and submit the changes

* **Normal Flow**.
  * The conference host signs in on the app
  * Goes to the menu choosing the edit talks tab
  * Reschedules the desired talk
  * The system will send a notification to all of the atendees

* **Alternative flows and exceptions**
  * The conference host can change the information without internet connection and the system will ensure that every atendee receives the notification as soon as the conference host turns on the internet

**Change Room**
* **Actor**. Conference host

* **Description**. The conference host can send a notification to the atendees when the room of a talk is changed

* **Preconditions and Postconditions**. The conference host needs to sign in as a staff member and go to the edit talks tab, make the room change and submit the changes

* **Normal Flow**.
  * The conference host signs in on the app
  * Goes to the menu choosing the edit talks tab
  * Changes the room of the desired talk
  * The system will send a notification to all of the atendees

* **Alternative flows and exceptions**
  * The conference host can change the information without internet connection and the system will ensure that every atendee receives the notification as soon as the conference host turns on the internet

### [User stories](userstories.md)
**List**:

1. Conference
    * [Show conference preview](userstories.md#Story-4).

2. Timetable
    * [See updated timetable](userstories.md#Story-3).

2. Talk
    * [Show talk details](userstories.md#Story-7).
    * [Update talk room](userstories.md#Story-6).
    * [Reschedule talk](userstories.md#Story-5).
    * [Add Talk](userstories.md#story-14)
    * [Delete Talk](userstories.md#Story-15)

4. Receive notifications
    * [When room changes](userstories.md#Story-2).
    * [When talk is postponed](userstories.md#Story-1).

5. Send notifications
    * [When room changes](userstories.md#Story-8).
    * [When timetable changes](userstories.md#Story-9).

6. Sign in
    * [Sign in as guest](userstories.md#Story-10).
    * [Sign in as staff](userstories.md#Story-11).

8. Home page
    * [Conference information](userstories.md#Story-13).
    * [Next Event](userstories.md#Story-12).


### Domain model

---

## Architecture and Design


### Logical architecture

![logical-architecture-diagram](https://i.imgur.com/20MdCcD.png)

The high-level logical structure of our code follows the **Model-View-Controller Architectural Pattern**, also known as the **MVC Pattern**.  
- The **Model** corresponds to the models package in the application. It stores all the relevant data used by AdOv such as talks' time and place, speakers and description. 
- The **View** corresponds to the widgets package. It displays the app information and state, for example, the login page, conference schedule page and the talk page.
- Finally, the **Controller** corresponds to the screens package. It's responsible for performing the actions requested by the user and generate the results to be displayed. One example is when a host changes a talk's schedule, the screens package will take care of changing the data so that it can be displayed by the widgets.


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
