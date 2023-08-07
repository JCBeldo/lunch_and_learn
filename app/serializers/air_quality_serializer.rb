class AirQualitySerializer
  include JSONAPI::Serializer

  set_type :air_quality
  set_id :id
  attributes  :aqi,
              :pm25,
              :CO_conc
end
