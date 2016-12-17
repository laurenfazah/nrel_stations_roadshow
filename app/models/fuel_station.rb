class FuelStation
  attr_reader :name, :address, :fuel_type, :distance, :access_times
  def initialize(raw_station)
    @name         = raw_station[:station_name]
    @address      = "#{raw_station[:street_address]}, #{raw_station[:city]}, #{raw_station[:state]}"
    @fuel_type    = raw_station[:fuel_type_code]
    @distance     = raw_station[:distance]
    @access_times = raw_station[:access_days_time]
  end
end
