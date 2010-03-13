require File.dirname(__FILE__) + '/test_helper.rb'

class TestUploader < Test::Unit::TestCase

    def setup
        @@u = WeatherUnderground::Uploader.new("foo","pass")
    end
    
    def test_uris
        assert_equal(
                      "http://weatherstation.wunderground.com/weatherstation/updateweatherstation.php?ID=foo&PASSWORD=pass&dateutc=#{Time.now.utc.strftime("%Y-%m-%d %H:%M:%S")}&action=updateraw",
                      @@u.url
                      )
    end
end
