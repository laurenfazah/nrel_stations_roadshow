class NrelSearch
  def initialize(query)
    @query = query
  end

  def self.filter(query)
    new(query).filter
  end

  def filter
    nrel_stations.map do |raw_station|
      FuelStation.new(raw_station)
    end
  end

  private
    attr_reader :query

    def nrel_stations
      @nrel_stations ||= NrelService.nearest_stations(location: query[:zip])
    end
end
