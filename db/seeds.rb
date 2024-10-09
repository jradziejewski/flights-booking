Airport.destroy_all

# Create multiple airports
Airport.create([
  { code: 'LAX', name: 'Los Angeles International Airport', country: 'USA' },
  { code: 'JFK', name: 'John F. Kennedy International Airport', country: 'USA' },
  { code: 'HND', name: 'Tokyo Haneda Airport', country: 'Japan' },
  { code: 'LHR', name: 'Heathrow Airport', country: 'UK' },
  { code: 'CDG', name: 'Charles de Gaulle Airport', country: 'France' },
  { code: 'DXB', name: 'Dubai International Airport', country: 'UAE' }
])

Flight.destroy_all

departure_airport = Airport.first
arrival_airport = Airport.second

Flight.create([
  {
    arrival_airport_id: arrival_airport.id,
    departure_airport_id: departure_airport.id,
    departure_date: DateTime.now + 1.day,
    duration: 120 # Duration in minutes
  },
  {
    arrival_airport_id: arrival_airport.id,
    departure_airport_id: departure_airport.id,
    departure_date: DateTime.now + 4.day,
    duration: 220 # Duration in minutes
  },
  {
    arrival_airport_id: arrival_airport.id,
    departure_airport_id: departure_airport.id,
    departure_date: DateTime.now + 2.day,
    duration: 90 # Duration in minutes
  }
])
