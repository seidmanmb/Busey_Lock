module LocationsHelper
  #Parse the API data and store it so that we can work with it
  def fetch_buses_from_api(source_url)
    http = Net::HTTP.get_response(URI.parse(source_url))
    data = http.body
    JSON.parse(data)
  end

  def is_nearby?(user_lat, user_long, bus_lat, bus_long)
    # Maximum Distance in degrees
    max_distance = 0.01 #  0.01 degrees is about half a mile

    difference_latitudes = user_lat - bus_lat.to_f
    difference_longitudes = user_long - bus_long.to_f

    distance = Math.sqrt(difference_latitudes ** 2 + difference_longitudes ** 2)

    distance <= max_distance
  end
end
