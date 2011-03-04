module WeatherUnderground
    module CurrentObservation

        class IconSet
            include HappyMapper
            
            tag 'icon_set'

            attribute :name,        String
            element   :icon_url,    String
        end

        class Icons
            include HappyMapper
            
            tag 'icons'

            has_many :icon_sets,    IconSet
        end
       
        class ObservationLocation
            include HappyMapper
            
            tag 'observation_location'

            element :full,          String
            element :city,          String
            element :state,         String
            element :country,       String
            element :latitude,      String
            element :longitude,     String
            element :elevation,     String
        end
        
        class DisplayLocation
            include HappyMapper
            
            tag 'display_location'

            element :full,          String
            element :city,          String
            element :state,         String
            element :state_name,    String
            element :country,       String
            element :zip,           String
            element :latitude,      String
            element :longitude,     String
            element :elevation,     String
        end
        
        class Image
            include HappyMapper
            
            tag 'image'

            element :url,           String
            element :title,         String
            element :link,          String
        end

        class Base
            include HappyMapper

            tag 'current_observation'

            element :credit,                    String 
            element :credit_URL,                String
            element :station_id,                String
            element :image,                     Image
            element :display_location,          DisplayLocation
            element :observation_location,      ObservationLocation

            element :station_id,                String
            element :observation_time,          String
            element :observation_time_rfc822,   String
            element :observation_epoch,         String
            element :local_time,                String
            element :local_time_rfc822,         String
            element :local_epoch,               String
            element :weather,                   String
            element :temperature_string,        String
            element :temp_f,                    String
            element :temp_c,                    String
            element :relative_humidity,         String
            element :wind_string,               String
            element :wind_dir,                  String
            element :wind_degrees,              String
            element :wind_mph,                  String
            element :wind_gust_mph,             String
            element :pressure_string,           String
            element :pressure_mb,               String
            element :pressure_in,               String
            element :dewpoint_string,           String
            element :dewpoint_f,                String
            element :dewpoint_c,                String
            element :heat_index_string,         String
            element :heat_index_f,              String
            element :heat_index_c,              String
            element :windchill_string,          String
            element :windchill_f,               String
            element :windchill_c,               String
            element :visibility_mi,             String
            element :visibility_km,             String

            element :icons,                     Icons

            element :icon_url_base,             String
            element :icon_url_name,             String
            element :icon,                      String
            element :forecast_url,              String
            element :history_url,               String
            element :ob_url,                    String
        end
    end
end
