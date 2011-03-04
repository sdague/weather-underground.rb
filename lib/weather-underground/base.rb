require 'happymapper'
require 'rest_client'

module WeatherUnderground

    # This is an data retriever for the weather underground personal weather
    # station service, as found at http://wunderground.com.   
    #
    # It is build from the documentation provided at
    # http://wiki.wunderground.com/index.php/API_-_XML 
    class Base
        include Utils

    
        def initialize
        end

        # Return the current observed weather data from location for +loc+
        #
        # +loc+ can be:
        # * zipcode (US or Canadian)
        # * city state; city, state
        # * city
        # * state
        # * country
        # * airport code (3-letter or 4-letter)
        # * lat,lon
        def CurrentObservations( loc )
            WXCurrentObXML( loc ) 
        end

        # Return the forecast weather data from location for +loc+
        #
        # A +SimpleForecast+ contains more detailed data for each day than
        # a +TextForcase+ of the same location.
        #
        # +loc+ can be:
        # * zipcode (US or Canadian)
        # * city state; city, state
        # * city
        # * state
        # * country
        # * airport code (3-letter or 4-letter)
        # * lat,lon
        def SimpleForecast( loc )
            f = ForecastXML( loc )
            f.simple_forecast
        end

        # Return the forecast weather data from location for +loc+
        #
        # A +TextForecast+ contains basic data in sentence form for the
        # location queried. If you need more detailed data use
        # a +SimpleForecast+
        #
        # +loc+ can be:
        # * zipcode (US or Canadian)
        # * city state; city, state
        # * city
        # * state
        # * country
        # * airport code (3-letter or 4-letter)
        # * lat,lon
        def TextForecast( loc )
            f = ForecastXML( loc )
            f.text_forecast
        end

        #--
        # TODO: Implement GeoLookup
        #++ 
        def GeoLookup( loc )

        end

        # Return any active weather alerts for +loc+
        #
        # +loc+ can be:
        # * zipcode (US or Canadian)
        # * city state; city, state
        # * city
        # * state
        # * country
        # * airport code (3-letter or 4-letter)
        # * lat,lon
        def Alerts( loc )
            AlertsXML( loc )
        end

    private

        def GeoLookupXML( loc )
            #TODO: Build Out
            puts "GeoLookup not yet implemented"
            
            #base_url = "http://api.wunderground.com/auto/wui/geo/GeoLookupXML/index.xml"
            #location_xml = RestClient.get base_url, {:params => {:query => loc}}
            #GeoLookup.parse( location_xml )
        end

        def AlertsXML( loc )
            base_url = "http://api.wunderground.com/auto/wui/geo/AlertsXML/index.xml"
            alert_xml = RestClient.get base_url, {:params => {:query => loc}}
            Alerts.parse( alert_xml )
        end

        def WXCurrentObXML( loc )
            base_url = "http://api.wunderground.com/auto/wui/geo/WXCurrentObXML/index.xml"
            current_observations_xml = RestClient.get base_url, {:params => {:query => loc}}
            CurrentObservation::Base.parse( current_observations_xml )
        end

        def ForecastXML( loc )
            base_url = "http://api.wunderground.com/auto/wui/geo/ForecastXML/index.xml"
            
            forecast_xml = RestClient.get base_url, {:params => {:query => loc}}
            Forecast::Base.parse( forecast_xml )
        end
    end
end
