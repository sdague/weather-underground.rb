# Weather Underground API subject to TOS at http://www.wunderground.com/members/tos.asp#api
module WeatherUnderground
    module Forecast
        class High
            include HappyMapper

            tag 'high'

            element :fahrenheit,        Float
            element :celsius,           Float

            def f
                @fahrenheit
            end

            def c
                @celsius
            end
        end

        class Low
            include HappyMapper

            tag 'low'
            
            element :fahrenheit,        Float
            element :celsius,           Float

            def f
                @fahrenheit
            end

            def c
                @celsius
            end
        end

        class Date
            include HappyMapper
            
            tag 'date'

            element :epoch,             Integer
            element :pretty_short,      String
            element :pretty,            String
            element :day,               Integer
            element :month,             Integer
            element :year,              Integer
            element :yday,              Integer
            element :hour,              Integer
            element :min,               Integer
            element :sec,               Integer
            element :isdst,             Boolean
            element :monthname,         String
            element :weekday_short,     String
            element :weekday,           String
            element :ampm,              String
            element :tz_short,          String
            element :tz_long,           String
        end

        class SimpleForecastDay
            include HappyMapper
            
            tag 'forecastday'

            element :period,            Integer
            element :icon,              String
            element :conditions,        String
            element :icon,              String
            element :skyicon,           String
            has_one :date_info,         Date
            has_one :high,              High
            has_one :low,               Low

            attr_accessor :datetime

            after_parse { |o|
                o.datetime  = Time.at( o.date_info.epoch ) if o.date_info
                o.date_info = nil
            }
        end

        class TextForecastDay
            include HappyMapper
            
            tag 'forecastday'

            element :period,            Integer
            element :icon,              String
            element :title,             String
            element :text,              String,     :tag => 'fcttext'

        end
        
        class TextForecast
            include HappyMapper

            tag 'txt_forecast'
            element :date,              Time
            element :number,            Integer
            has_many :days,             TextForecastDay
        end
        
        class SimpleForecast
            include HappyMapper

            tag 'simpleforecast'
            
            has_many :days,             SimpleForecastDay
        end
        
        class Base
            include HappyMapper

            tag 'forecast'

            has_one :simple_forecast, SimpleForecast
            has_one :text_forecast,   TextForecast
        end
    end
end


