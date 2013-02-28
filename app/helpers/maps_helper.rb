require 'open-uri'

module MapsHelper

  def map_src_for(location, size, zoom)
    encloc = CGI.escape(location)
    %Q(http://maps.googleapis.com/maps/api/staticmap?center=#{encloc}&zoom=#{zoom}&size=#{size}x#{size}&sensor=false&markers=color:blue|#{encloc})
  end

  def map_for(location, size=200, zoom=14)
    tag :img, :src => map_src_for(location, size, zoom), :class => 'map'
  end

end
