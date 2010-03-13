module WeatherUnderground
        
    class Uploader
        require "uri"
        require "open-uri"
        
        BaseURL = "http://weatherstation.wunderground.com/weatherstation/updateweatherstation.php"
        
        def initialize(station, passwd)
            @station = station
            @passwd = passwd
        end
        
        def url(params = {})
            base = "#{BaseURL}?ID=#{@station}&PASSWORD=#{@passwd}"
            base += "&dateutc=#{Time.now.utc.strftime("%Y-%m-%d %H:%M:%S")}"
            base += "&action=updateraw"
            params.each do |k, v|
                base += "&#{k}=#{URI.escape(v)}"
            end
            return base
        end
        
        def update(data = {})
            
            
            
        end
    end
end
