require 'happymapper'
require 'rest_client'

module WeatherUnderground
    class Base
        include Utils

        def initialize
        end

        def CurrentObservations( loc )
            WXCurrentObXML( loc ) 
        end

        def SimpleForecast( loc )
            f = ForecastXML( loc )
            f.simple_forecast
        end

        def TextForecast( loc )
            f = ForecastXML( loc )
            f.text_forecast
        end

        def GeoLookup( loc )

        end

        def Alerts( loc )
            AlertsXML( loc )
        end

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
