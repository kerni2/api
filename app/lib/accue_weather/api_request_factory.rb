module AccueWeather
  class APIRequestFactory
    def uniq_id(city)
      generic_request.merge(
        {
          q: city,
          offset: false,
          alias: false
        }
      )
    end

    def current_temperature
      generic_request
    end

    def historical_temperature
      generic_request
    end
    
    private

    def generic_request
      {
        apikey: ENV.fetch('ACCU_WEATHER_API_KEY'),
        language: 'en',
        details: false
      }
    end
  end
end