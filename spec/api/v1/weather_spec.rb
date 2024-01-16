require 'rails_helper'

describe ::V1::Weather do
  context 'get current temperature' do
    let(:path) { '/api/v1/weather/current' }

    subject do
      get path
      response
    end

    it 'with success and return json' do
      client = double('text')

      res = { 'WeatherText': 'Party cloudy', 'Metric': {
        'Value': 23.0, 'Unit': 'C', 'UnitType': 17
      } }

      expect(::AccueWeather::Client).to receive(:new)
        .and_return(client)

      expect(client).to receive_message_chain(:uniq_id, :uniq_id)
        .and_return('243564')

      expect(client).to receive(:current_temperature)
        .and_return(::AccueWeather::APIResponse.new(res))

      is_expected.to be_successful
      expect(response.status).to eq(200)
    end
  end

  context 'get hourly temperature for the last 24 hours' do
    let(:path) { '/api/v1/weather/historical' }

    subject do
      get path
      response
    end

    it 'with success and return json' do
      client = double('text')

      res = { 
        body: [
          {
            'WeatherText' => 'Party cloudy',
            'EpochTime' => 1_323_677_865,
            'Temperature' => {
              'Metric' => {
                'Value': 23.0, 'Unit': 'C', 'UnitType': 17
              }
            }
          }
        ]
      }

      expect(::AccueWeather::Client).to receive(:new)
        .and_return(client)

      expect(client).to receive_message_chain(:uniq_id, :uniq_id)
        .and_return('243564')

      expect(client).to receive(:historical_temperature)
        .and_return(::AccueWeather::APIResponse.new(res))

      is_expected.to be_successful
      expect(response.status).to eq(200)
    end
  end

  context 'get maximal temperature for the last 24 hours' do
    let(:path) { '/api/v1/weather/historical/max' }

    subject do
      get path
      response
    end

    it 'with success and return json' do
      client = double('text')

      res = { 
        body: [
          {
            'WeatherText' => 'Party cloudy',
            'EpochTime' => 1_323_677_865,
            'Temperature' => {
              'Metric' => {
                'Value': 23.0, 'Unit': 'C', 'UnitType': 17
              }
            }
          }
        ]
      }

      expect(::AccueWeather::Client).to receive(:new)
        .and_return(client)

      expect(client).to receive_message_chain(:uniq_id, :uniq_id)
        .and_return('243564')

      expect(client).to receive(:historical_temperature)
        .and_return(::AccueWeather::APIResponse.new(res))

      is_expected.to be_successful
      expect(response.status).to eq(200)
    end
  end

  context 'get minimal temperature for the last 24 hours' do
    let(:path) { '/api/v1/weather/historical/min' }

    subject do
      get path
      response
    end

    it 'with success and return json' do
      client = double('text')

      res = { 
        body: [
          {
            'WeatherText' => 'Party cloudy',
            'EpochTime' => 1_323_677_865,
            'Temperature' => {
              'Metric' => {
                'Value': 23.0, 'Unit': 'C', 'UnitType': 17
              }
            }
          }
        ]
      }

      expect(::AccueWeather::Client).to receive(:new)
        .and_return(client)

      expect(client).to receive_message_chain(:uniq_id, :uniq_id)
        .and_return('243564')

      expect(client).to receive(:historical_temperature)
        .and_return(::AccueWeather::APIResponse.new(res))

      is_expected.to be_successful
      expect(response.status).to eq(200)
    end
  end

  context 'get average temperature for the last 24 hours' do
    let(:path) { '/api/v1/weather/historical/avg' }

    subject do
      get path
      response
    end

    it 'with success and return json' do
      client = double('text')

      res = { 
        body: [
          {
            'WeatherText' => 'Party cloudy',
            'EpochTime' => 1_323_677_865,
            'Temperature' => {
              'Metric' => {
                'Value' => 23.0, 'Unit' => 'C', 'UnitType' => 17
              }
            }
          }
        ]
      }

      expect(::AccueWeather::Client).to receive(:new)
        .and_return(client)

      expect(client).to receive_message_chain(:uniq_id, :uniq_id)
        .and_return('243564')

      expect(client).to receive(:historical_temperature)
        .and_return(::AccueWeather::APIResponse.new(res))

      is_expected.to be_successful
      expect(response.status).to eq(200)
    end
  end
end