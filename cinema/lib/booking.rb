class Booking
  
  attr_accessor :value, :value_start, :value_end, :status
  
  def initialize(value = "")
    @value = value
    @status = "new"
  end

  def split_booking_reference
    value_array = @value.gsub(/[()]/, "").split(',', -1)
    @value_start = value_array[1].split(':', -1)
    @value_end = value_array[2].split(':', -1)
  end

  def valid?
    split_booking_reference
    return false if check_rows == "invalid row"
    return false if check_seats == "invalid seats"
    true
  end

  def check_rows
    return "invalid row" if @value_start[0] != @value_end[0]
    return "invalid row" if @value_start[0].to_i < 0 || @value_start[0].to_i > 99
  end

  def check_seats
    return "invalid seats" if value_start[1] > value_end[1] 
    return "invalid seats" if value_start[1].to_i < 0 || value_end[1].to_i > 49
    return "invalid seats" if value_end[1].to_i - value_start[1].to_i > 5
  end

  def process
    return @status = "rejected" unless self.valid?
    
    @status = "confirmed"
  end

end