require 'open-uri'

module MapsHelper

  def map_src_for(location)
    encloc = CGI.escape(location)
    %Q(http://maps.googleapis.com/maps/api/staticmap?center=#{encloc}&zoom=15&size=400x400&sensor=false&markers=color:blue|#{encloc})
  end

  def map_for(location)
    tag :img, :src => map_src_for(location)
  end

end
