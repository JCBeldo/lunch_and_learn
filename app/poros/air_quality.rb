class AirQuality
  attr_reader :id,
              :type,
              :aqi,
              :pm25_concentration,
              :co_concentration

  def initialize(data)
    @id = data[:id]
    @type = data[:type]
    @aqi = data[:overall_aqi]
    @pm25_concentration = data["PM2.5"]
    @co_concentration = data[:CO]
  end
end