#Some helpers. Used as a mixin
module WeatherUnderground
    module Utils
        def c_to_f( c )
            ( c * ( 9 / 5 ) ) + 32
        end

        def f_to_c( f )
            ( f - 32 ) * ( 5 / 9 )
        end
    end
end
