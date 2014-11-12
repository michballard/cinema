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

    it 'returns false if booking rows are not in valid range between 0 and 99' do 
      booking2 = Booking.new("(1,167:44,167:50)")
      expect(booking2.valid?).to eq false
    end

    it 'returns false if booking seats are not in the same row' do 
      booking3 =Booking.new("(1,67:44,68:48)")
      expect(booking3.valid?).to eq false
    end

    it 'returns false if booking seats are not in valid range between 0 and 49' do 
      booking4 = Booking.new("(1,67:44,67:50)")
      expect(booking4.valid?).to eq false
    end

    it 'returns false if booking is for more than 5 seats' do 
      booking = Booking.new("(1,0:0,0:6)")
      expect(booking.valid?).to eq false
    end 

  end 

  context 'processing a booking' do 
    booking5 = Booking.new("(1,67:44,67:47)")

    it 'can accept a booking' do       
      expect(booking5.status).to eq 'new'
      booking5.process
      expect(booking5.status).to eq 'confirmed'
    end 

    it 'can reject a booking that is invalid' do 
      booking6 = Booking.new("(1,67:46,67:50)")
      expect(booking6.status).to eq 'new'
      booking6.process
      expect(booking6.status).to eq 'rejected'
    end

    xit 'can reject a booking if seats are taken' do 
      booking7 = Booking.new("(1,67:44,67:47)")
      expect(booking7.status).to eq 'new'
      booking7.process
      expect(booking7.status).to eq 'rejected'
    end 

  end 

end 