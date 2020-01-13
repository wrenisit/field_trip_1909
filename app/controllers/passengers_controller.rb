class PassengersController <ApplicationController
  def show
    @passenger = Passenger.find(params[:id])
  end

  def new_flight
    @passenger = Passenger.find(params[:id])
  end

  def add_flight
    passenger = Passenger.find(params[:id])
    flight = Flight.find_by(number: params[:flight])
    FlightPassenger.create(flight: flight, passenger: passenger)
    redirect_to "/passengers/#{passenger.id}"
  end
end
