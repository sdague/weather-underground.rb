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
            base += "&dateutc=#{URI.escape(Time.now.utc.strftime("%Y-%m-%d %H:%M:%S"))}"
            base += "&action=updateraw"
            # we sort them just so we get predictable order for tests
            params.sort {|a, b| a.to_s <=> b.to_s}.each do |k, v|
                base += "&#{k}=#{URI.escape(v.to_s)}"
            end
            return base
        end
        
        def update(data = {})
            open(url(data)) do |f|
                # we should really do something with the response
                
            end
        end
    end
end
