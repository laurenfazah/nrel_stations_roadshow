class NrelService
  def initialize(search_params)
    @search_params = search_params
  end

  def nearest_stations
    nrel_stations = conn.get("alt-fuel-stations/v1/nearest.json",         filter.merge(search_params)).body
    JSON.parse(nrel_stations, symbolize_names: true)[:fuel_stations]
  end

  def self.nearest_stations(filter)
    new(filter).nearest_stations
  end

  private
    attr_reader :search_params

    def filter
      {
        api_key: ENV['NREL_API_KEY'],
        limit: 10,
        radius: 6
      }
    end

    def conn
      @conn ||= Faraday.new(url: 'http://developer.nrel.gov/api/') do |faraday|
        faraday.adapter  Faraday.default_adapter
      end
    end
end
