# Clear existing data
Airport.destroy_all
Flight.destroy_all

# Create three airports
airports = Airport.create([
  { code: 'LAX', name: 'Los Angeles International Airport', country: 'USA' },
  { code: 'JFK', name: 'John F. Kennedy International Airport', country: 'USA' },
  { code: 'HND', name: 'Tokyo Haneda Airport', country: 'Japan' }
])

# Generate flights for each combination of airports for the next 3 days
departure_dates = (1..3).map { |day| DateTime.now + day.days }

airports.combination(2).to_a.each do |departure_airport, arrival_airport|
  departure_dates.each do |departure_date|
    # Generate a random duration between 60 and 300 minutes
    duration = rand(60..300)

    # Create a new flight
    Flight.create(
      arrival_airport_id: arrival_airport.id,
      departure_airport_id: departure_airport.id,
      departure_date: departure_date,
      duration: duration
    )
  end
end
