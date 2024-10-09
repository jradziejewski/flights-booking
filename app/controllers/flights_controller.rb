class FlightsController < ApplicationController
  def index
    airports = Airport.all
    @airport_name_option = airports.map { |airport| [ airport.name, airport.id ] }
    if flight_params.present?
      @flights = Flight.where(departure_airport_id: flight_params[:departure_airport_id])
                     .where(arrival_airport_id: flight_params[:arrival_airport_id])
       .where("DATE(departure_date) = ?", Date.parse(flight_params[:departure_date]))
    else
      @flights = Flight.none
    end

    @passenger_option = (1..4).to_a
    # Fetch unique departure dates from the flights
    @flight_date_option = Flight.select(:departure_date).distinct.map do |flight| [ flight.departure_date.strftime("%a, %Y-%m-%d"), flight.departure_date ] end
  end


  private
    def flight_params
      params.permit(:departure_airport_id, :arrival_airport_id, :departure_date, :duration)
    end
end
