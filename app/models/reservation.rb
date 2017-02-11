class Reservation < ActiveRecord::Base
  validates_length_of :rcrd_loc, is: 6, message: 'Invalid Confirmation #'
  validates_presence_of :first_name, message: 'First Name cannot be blank'
  validates_presence_of :last_name, message: 'Last Name cannot be blank'
  validates_presence_of :email, message: 'Email cannot be blank'
  validate :email_booth
  validate :reservation_is_valid
  
  has_many :segments, dependent: :destroy
    
  self.primary_key = 'rcrd_loc'

  private
  
  def email_booth
    email.include?("@chicagobooth.edu") ? return : errors.add(:email, 'Invalid Booth email')
  end
  
  # Ping Southwest to check if reservation is valid
  def reservation_is_valid
    result = Luvwrapper.view_reservation(self.rcrd_loc, self.first_name, self.last_name)
    
    if result.success?
      itinerary = result.itinerary
      itinerary.destinations.each do |destination|
        destination.segments.each do |s|
          @seg = Segment.new(:origin => s.departing_airport_code,
                             :flt_time => s.departing_time,
                             :checkin_time => (self.a_list ? s.departing_time - 36.hours : s.departing_time - 24.hours))
          @seg.save
          self.segments << @seg
        end
      end
      return
    else 
      errors.add(:rcrd_loc, 'Invalid Confirmation #')
    end
  end
  
end
