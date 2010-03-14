module WeatherUnderground
    # This is an uploader for the weather underground personal weather
    # station service, as found at http://wunderground.com.  This
    # makes it easier to build custom software to upload to the
    # service allowing greater flexibility in the number of different
    # weather sensors you can use.
    #
    # It is build from the documentation provided at
    # http://wiki.wunderground.com/index.php/PWS_-_Upload_Protocol
    class Uploader
        require "uri"
        require "open-uri"
        
        # This is the base url for uploading
        BaseURL = "http://weatherstation.wunderground.com/weatherstation/updateweatherstation.php"
        
        # Create an uploader object.  Station is your registered
        # station id from wunderground, password is the password you
        # created for it.
        def initialize(station, passwd)
            @station = station
            @passwd = passwd
        end

        # Build the url to use for the upload.  You probably don't
        # want to call this directly, though there is no harm in doing
        # so.
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
        
        # Update with data.  Data is of the form of :name => value for
        # the parameters shown here:
        # http://wiki.wunderground.com/index.php/PWS_-_Upload_Protocol.
        #
        # The required parameters are automatically filled in by the
        # module, just provide the data that you want to upload.
        #
        #  w.update(:temp => 67.5, :humidity => 40)
        def update(data = {})
            open(url(data)) do |f|
                # TODO: check the response
                
            end
        end
    end
end
