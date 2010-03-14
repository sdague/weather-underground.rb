require File.dirname(__FILE__) + '/test_helper.rb'

class TestUploader < Test::Unit::TestCase
    
    def test_uris
        u = WeatherUnderground::Uploader.new("foo","pass")
        
        assert_equal(
                      "http://weatherstation.wunderground.com/weatherstation/updateweatherstation.php?ID=foo&PASSWORD=pass&dateutc=#{URI.escape(Time.now.utc.strftime("%Y-%m-%d %H:%M:%S"))}&action=updateraw",
                      u.url
                      )
        
        assert_equal(
                      "http://weatherstation.wunderground.com/weatherstation/updateweatherstation.php?ID=foo&PASSWORD=pass&dateutc=#{URI.escape(Time.now.utc.strftime("%Y-%m-%d %H:%M:%S"))}&action=updateraw&tempf=69.1",
                      u.url(:tempf => 69.1)
                      )
        
        assert_equal(
                      "http://weatherstation.wunderground.com/weatherstation/updateweatherstation.php?ID=foo&PASSWORD=pass&dateutc=#{URI.escape(Time.now.utc.strftime("%Y-%m-%d %H:%M:%S"))}&action=updateraw&dewptf=54.326&humidity=50&tempf=69.1",
                      u.url(:tempf => 69.1, :humidity => 50, :dewptf => 54.326)
                      )

           assert_equal(
                      "http://weatherstation.wunderground.com/weatherstation/updateweatherstation.php?ID=foo&PASSWORD=pass&dateutc=#{URI.escape(Time.now.utc.strftime("%Y-%m-%d %H:%M:%S"))}&action=updateraw&dewptf=54.326&humidity=50&tempf=69.1",
                      u.url(:humidity => 50, :tempf => 69.1, :dewptf => 54.326)
                      )
        
    end
    
end
