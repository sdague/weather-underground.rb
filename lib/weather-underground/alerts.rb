# Weather Underground API subject to TOS at http://www.wunderground.com/members/tos.asp#api

module WeatherUnderground

    class AlertExpires
        include HappyMapper

        tag 'expires'

        attribute 'epoch',      Integer
        content   'text'

        def text
            @text
        end

        def datetime
            Time.at( @epoch )
        end
    end

    class AlertDate
        include HappyMapper

        tag 'date'

        attribute 'epoch',      Integer
        content   'text'

        def text
            @text
        end

        def datetime
            Time.at( @epoch )
        end
    end

    class Alert
        include HappyMapper

        tag 'AlertItem'

        element :type,          String
        element :description,   String
        has_one :date,          AlertDate
        has_one :expires,       AlertExpires
        element :message,       String
        element :phenomena,     String
        element :significance,  String
    end


    class Alerts
        include HappyMapper

        tag 'alerts'
        
        has_many :alerts,       Alert
    end
end
