class Booking
  
  attr_accessor :value, :value_start, :value_end
  
  def initialize(value = "")
    @value = value
  end

  def split_booking_reference
    value_array = @value.gsub(/[()]/, "").split(',', -1)
    @value_start = value_array[1].split(':', -1)
    @value_end = value_array[2].split(':', -1)
  end

  def valid?
    split_booking_reference
    return false if value_start[0] != value_end[0]
    return false if value_start[0].to_i < 0 || value_start[0].to_i > 99
    return false if value_start[1] > value_end[1] 
    return false if value_end[1].to_i < 0 || value_end[1].to_i > 49
    true
  end

end