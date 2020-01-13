class Flight <ApplicationRecord
  validates_presence_of :number, :date, :time, :departure_city, :arrival_city
  belongs_to :airline
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  def passenger_count(type = true)
    if type
      passengers.where("age > ?", 17).count
    else
      passengers.where("age < ?", 18).count
    end
  end
end
