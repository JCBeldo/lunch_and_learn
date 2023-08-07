class AirQualitySerializer
  include JSONAPI::Serializer

  set_type :air_quality
  set_id :id
  attributes  :aqi,
              :pm25_concentration,
              :co_concentration
end
