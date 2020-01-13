require 'rails_helper'

RSpec.describe "passenger show page" do
  it "shows passenger data and flights" do
    airline1 = Airline.create(name:"Delta")
    flight_1 = Flight.create(number:"1077", date:"01/10/2010", time: "08:30", departure_city: "Dallas", arrival_city: "Miami", airline_id: airline1.id )
    passenger_1 = Passenger.create(name: "James Smith", age: "22")
    passenger_2 = Passenger.create(name: "Donna Smith", age: "13")
    FlightPassenger.create(flight: flight_1, passenger: passenger_1)
    FlightPassenger.create(flight: flight_1, passenger: passenger_2)

    visit "/passengers/#{passenger_1.id}"

    expect(page).to have_content("Name: #{passenger_1.name}")
    expect(page).not_to have_content("Name: #{passenger_2.name}")
    within "#flights" do
      expect(page).to have_content("Flights")
      expect(page).to have_link("#{flight_1.number}")
    end
  end

  it "can add passenger to new flight" do
    airline1 = Airline.create(name:"Delta")
    flight_1 = Flight.create(number:"1077", date:"01/10/2010", time: "08:30", departure_city: "Dallas", arrival_city: "Miami", airline_id: airline1.id )
    flight_2 = Flight.create(number:"888", date:"01/15/2010", time: "15:15", departure_city: "Miami", arrival_city: "Dallas", airline_id: airline1.id )
    passenger_1 = Passenger.create(name: "James Smith", age: "22")
    FlightPassenger.create(flight: flight_1, passenger: passenger_1)
    visit "/passengers/#{passenger_1.id}"
    click_button("Assign To A Flight")

    expect(current_path).to eq("/passengers/#{passenger_1.id}/new")

    fill_in :flight, with: "#{flight_2.number}"
    click_button("Submit")
    expect(current_path).to eq("/passengers/#{passenger_1.id}")
    within "#flights" do
      expect(page).to have_content("Flights")
      expect(page).to have_link("#{flight_1.number}")
      expect(page).to have_link("#{flight_2.number}")
    end
  end
end
