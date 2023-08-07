class AirQuality
  attr_reader :id,
              :type,
              :aqi,
              :pm25,
              :CO_conc

  def initialize(data)
    @id = data[:id]
    @type = data[:type]
    @aqi = data[:overall_aqi]
    @pm25 = data["PM2.5"]
    @CO_conc = data[:CO]
  end
end