class GeoPosition
  attr_reader :latitude, :longitude

  def initialize(latitude:, longitude:)
    @latitude = latitude
    @longitude = longitude
  end

  def to_s
    "#{latitude},#{longitude}"
  end

  def distance_in_km_to(another)
    lat1 = degrees_to_radians(latitude)
    lat2 = degrees_to_radians(another.latitude)
    lon1 = degrees_to_radians(longitude)
    lon2 = degrees_to_radians(another.longitude)
    delta_lon = (lon1 - lon2).abs

    delta_angle = Math.acos(
        Math.sin(lat1) * Math.sin(lat2) +
            Math.cos(lat1) * Math.cos(lat2) * Math.cos(delta_lon)
    )
    earth_radius_km * delta_angle
  end

  private

  # Earth radius is the distance from the center of Earth to a point on its surface.
  # Its value ranges from 6,378 km (3,963 mi) at the equator to 6,357 km (3,950 mi) at a pole.
  # When only one radius is stated, the International Astronomical Union (IAU) prefers that it be
  # the equatorial radius.
  def earth_radius_km
    6378
  end

  def degrees_to_radians(angle_in_degrees)
    angle_in_degrees * Math::PI / 180.0
  end
end