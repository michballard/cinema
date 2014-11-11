require 'booking'

describe Booking do 

  context 'initialisation' do 

    it 'starts will a nil value' do 
      booking = Booking.new
      expect(booking.value).to eq ""
    end 

  end 

  context 'validating a booking range' do 

    it 'returns true for a valid booking' do 
      booking1 = Booking.new("(1,67:44,67:47)")
      expect(booking1.valid?).to eq true
    end

    it 'returns false if booking rows are invalid' do 
      booking2 = Booking.new("(1,167:44,167:50)")
      expect(booking2.valid?).to eq false
    end

    it 'returns false if booking seats are not in the same row' do 
      booking3 =Booking.new("(1,67:44,68:48)")
      expect(booking3.valid?).to eq false
    end

    it 'returns false if booking seats are invalid' do 
      booking4 = Booking.new("(1,67:44,67:50)")
      expect(booking4.valid?).to eq false
    end

  end 

  # context 'processing a booking' do 

  #   it 'can accept a booking' do 

  #   end 

  #   it 'can decline a booking' do 

  #   end 

  # end 

end 