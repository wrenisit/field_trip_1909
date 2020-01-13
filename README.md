# BEM2 Final Technical Assessment

## Description
Field Trip is an app that allows a user to see airlines, flights, and passengers. Airlines have many flights, and flights belong to airlines. This one to many relationship is already set up for you. You will need to set up the table and relationship between passengers and flights. Flights have many passengers and passengers can have many flights. Make sure to read all instructions, tasks, and user stories before getting started. Also, take a look at your schema to see what you're working with to start.

## Instructions

* Work on this assessment independently. DO NOT discuss with anyone.
* Fork this repository
* Clone your fork
* Run `bundle`
* Run `rake db:{drop,create,migrate,seed}`
* Complete the tasks below
* Push your code to your fork once the time is up (not before!)

## Tasks
1. Create a passengers table
  - Passengers will have a name and age

2. Set up a many to many relationship between flights and passengers

3. Complete the following user stories:


```
User Story 1, Flights Show Page

As a visitor
When I visit a flights show page ('/flights/:id')
I see all of that flights information including:
  - number
  - date
  - time
  - departure city
  - arrival city
And I see the name of the airline this flight belongs
And I see the names of all of the passengers on this flight
```

```
User Story 2, Passenger Show Page

As a visitor
When I visit a passengers show page ('/passengers/:id')
I see that passengers name
And I see a section of the page that displays all flight numbers of the flights for that passenger
And all flight numbers listed link to that flights show page
```

```
User Story 3, Assign a Passenger to a Flight

As a visitor
When I visit a passengers show page
I see a form to add a flight
When I fill in the form with a flight number (assuming these will always be unique)
And click submit
I'm taken back to the passengers show page
And I can see the flight number of the flight I just added
```

```
User Story 4, Count of Minors and Adults on Flight

As a visitor
When I visit a flights show page
I see the number of minors on the flight (minors are any passengers that are under 18)
And I see the number of adults on the flight (adults are any passengers that are 18 or older)
