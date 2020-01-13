require 'rails_helper'

RSpec.describe "flight show page" do
  it "shows a flight's show page" do
    airline1 = Airline.create(name:"Delta")
    flight_1 = Flight.create(number:"1077", date:"01/10/2010", time: "08:30", departure_city: "Dallas", arrival_city: "Miami", airline_id: airline1.id )
    passenger_1 = Passenger.create(name: "James Smith", age: "22")
    passenger_2 = Passenger.create(name: "Donna Smith", age: "13")
    passenger_3 = Passenger.create(name: "Kirk Smith", age: "54")
    passenger_4 = Passenger.create(name: "Kendall Jenner", age: "33")
    FlightPassenger.create(flight: flight_1, passenger: passenger_1)
    FlightPassenger.create(flight: flight_1, passenger: passenger_2)
    FlightPassenger.create(flight: flight_1, passenger: passenger_3)
    visit "/flights/#{flight_1.id}"
    expect(page).to have_content("Flight Number: #{flight_1.number}")
    expect(page).to have_content("Date: #{flight_1.date}")
    expect(page).to have_content("Time: #{flight_1.time}")
    expect(page).to have_content("Departure City: #{flight_1.departure_city}")
    expect(page).to have_content("Arrival City: #{flight_1.arrival_city}")
    expect(page).to have_content("Airline: #{flight_1.airline.name}")
    within "#passenger_manifest" do
      expect(page).to have_content("#{passenger_1.name}")
      expect(page).to have_content("#{passenger_2.name}")
      expect(page).to have_content("#{passenger_3.name}")
      expect(page).not_to have_content("#{passenger_4.name}")
    end
  end

  it "shows counts of minors and adults on flight" do
    airline1 = Airline.create(name:"Delta")
    flight_1 = Flight.create(number:"1077", date:"01/10/2010", time: "08:30", departure_city: "Dallas", arrival_city: "Miami", airline_id: airline1.id )
    passenger_1 = Passenger.create(name: "James Smith", age: "22")
    passenger_2 = Passenger.create(name: "Donna Smith", age: "13")
    passenger_3 = Passenger.create(name: "Kirk Smith", age: "54")
    FlightPassenger.create(flight: flight_1, passenger: passenger_1)
    FlightPassenger.create(flight: flight_1, passenger: passenger_2)
    FlightPassenger.create(flight: flight_1, passenger: passenger_3)
    visit "/flights/#{flight_1.id}"
    within "#passenger_statistics" do
      expect(page).to have_content("Adults: 2")
      expect(page).to have_content("Minors: 1")
    end
  end
end
