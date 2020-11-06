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
