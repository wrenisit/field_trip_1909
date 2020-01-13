require 'rails_helper'

RSpec.describe "flight show page" do
  it "shows a flight's show page" do
    airline = Airline.new(name: "Delta")
    flight_1 = Flight.new(number: "1077", date: "01/10/2010", time: "08:30", departure_city: "Dallas", arrival_city: "Miami", airline_id: airline.id )
    passenger_1 = Passenger.new(name: "James Smith", age: "22")
    passenger_2 = Passenger.new(name: "Donna Smith", age: "13")
    passenger_3 = Passenger.new(name: "Kirk Smith", age: "54")
    passenger_4 = Passenger.new(name: "Kendall Jenner", age: "33")
    FlightPassenger.new(flight: flight_1, passenger: passenger_1)
    FlightPassenger.new(flight: flight_1, passenger: passenger_2)
    FlightPassenger.new(flight: flight_1, passenger: passenger_3)
    visit "/flights/#{flight_1.id}"
    expect(page).to have_content("Flight: #{flight_1.number}")
    expect(page).to have_content("Date: #{flight_1.date}")
    expect(page).to have_content("Time: #{flight_1.time}")
    expect(page).to have_content("Departing: #{flight_1.departure_city}")
    expect(page).to have_content("Arriving: #{flight_1.arrival_city}")
    expect(page).to have_content("Arriving: #{flight_1.airline.name}")
    within "#passenger_manifest" do
      expect(page).to have_content("#{passenger_1.name}")
      expect(page).to have_content("#{passenger_2.name}")
      expect(page).to have_content("#{passenger_3.name}")
      expect(page).not_to have_content("#{passenger_4.name}")
    end
  end
end
