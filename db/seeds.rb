# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
airline1 = Airline.create(name:"Delta")
flight_1 = Flight.create(number:"1077", date:"01/10/2010", time: "08:30", departure_city: "Dallas", arrival_city: "Miami", airline_id: airline1.id )
passenger_1 = Passenger.create(name: "James Smith", age: "22")
passenger_2 = Passenger.create(name: "Donna Smith", age: "13")
passenger_3 = Passenger.create(name: "Kirk Smith", age: "54")
FlightPassenger.create(flight: flight_1, passenger: passenger_1)
FlightPassenger.create(flight: flight_1, passenger: passenger_2)
FlightPassenger.create(flight: flight_1, passenger: passenger_3)
flight_2 = Flight.create(number:"888", date:"01/15/2010", time: "15:15", departure_city: "Miami", arrival_city: "Dallas", airline_id: airline1.id )
