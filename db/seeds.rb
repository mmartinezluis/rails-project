# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




binding.pry

# THIS ONE WORKS
# curl -X GET \
# 'https://www.carboninterface.com/api/v1/auth' \
# -H 'authorization: Bearer 9IKzAe461HOBAFkGUwbkw' 

# DOES NOT WORK
# response = RestClient.get("https://www.carboninterface.com/api/v1/auth", {
#   'authorization: Bearer 9IKzAe461HOBAFkGUwbkw'
#   }
# )

# response = RestClient.get("test.api.amadeus.com")


require 'amadeus'

amadeus = Amadeus::Client.new({
  client_id: "#{ENV['AMADEUS_API_KEY']}",
  client_secret: "#{ENV['AMADEUS_API_SECRET']}"
})

begin
  puts amadeus.shopping.flight_offers_search.get(originLocationCode: 'NYC', destinationLocationCode: 'MAD', departureDate: '2021-06-01', adults: 1, max: 1).body
rescue Amadeus::ResponseError => error
  puts error
end

hotels_madrid_hash = amadeus.shopping.hotel_offers.get(cityCode: 'MAD')
all_hotels_madrid = hotels_madrid_hash.result
total_hotels_madrid = all_hotels_madrid["data"].length      # Total of 6 hotels
hotels_madrid_locations = hotels_madrid_hash.data
first_hotel_madrid = hotels_madrid_hash.data[0]
first_hotel_madrid_self_key = first_hotel_madrid["self"]

curl "https://test.api.amadeus.com/v2/shopping/hotel-offers/by-hotel?hotelId=INMAD23B" \
     -H "Authorization: Bearer #{ENV['AMADEUS_TOKEN_ACCESS']}"
