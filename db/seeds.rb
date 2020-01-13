# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
airline1 = Airline.create(name:"Delta")
airline2 = Airline.create(name:"Virgin")
airline3 = Airline.create(name:"Southwest")
flight_1 = Flight.create(number:"1077", date:"01/10/2010", time: "08:30", departure_city: "Dallas", arrival_city: "Miami", airline_id: airline1.id )
flight_2 = Flight.create(number:"888", date:"01/15/2010", time: "15:15", departure_city: "Miami", arrival_city: "Dallas", airline_id: airline1.id )
flight_3 = Flight.create(number:"1333", date:"01/20/2010", time: "02:30", departure_city: "Denver", arrival_city: "Los Angeles", airline_id: airline1.id )
flight_4 = Flight.create(number:"656", date:"01/6/2010", time: "21:20", departure_city: "Stockholm", arrival_city: "Paris", airline_id: airline2.id )
flight_5 = Flight.create(number:"111", date:"04/10/2010", time: "23:00", departure_city: "Paris", arrival_city: "Stockholm", airline_id: airline2.id )
flight_6 = Flight.create(number:"109", date:"06/10/2010", time: "13:10", departure_city: "Daytona", arrival_city: "New York", airline_id: airline1.id )
flight_7 = Flight.create(number:"1445", date:"09/10/2010", time: "10:25", departure_city: "Los Angeles", arrival_city: "Denver", airline_id: airline1.id )

passenger_1 = Passenger.create(name: "James Smith", age: "22")
FlightPassenger.create(flight: flight_1, passenger: passenger_1)
FlightPassenger.create(flight: flight_2, passenger: passenger_1)
FlightPassenger.create(flight: flight_3, passenger: passenger_1)
FlightPassenger.create(flight: flight_4, passenger: passenger_1)

passenger_2 = Passenger.create(name: "Donna Smith", age: "13")
FlightPassenger.create(flight: flight_1, passenger: passenger_2)
FlightPassenger.create(flight: flight_2, passenger: passenger_2)
FlightPassenger.create(flight: flight_3, passenger: passenger_2)
FlightPassenger.create(flight: flight_4, passenger: passenger_2)

passenger_3 = Passenger.create(name: "Kirk Smith", age: "54")
FlightPassenger.create(flight: flight_1, passenger: passenger_3)
FlightPassenger.create(flight: flight_2, passenger: passenger_3)
