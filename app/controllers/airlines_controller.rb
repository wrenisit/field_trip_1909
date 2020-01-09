class AirlinesController <ApplicationController

  def index
    @airlines = Airline.all
  end

  def show
    @airline = Airline.find(params[:id])
  end

end
