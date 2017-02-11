module ReservationsHelper
  def flight_time(input_time)
    time_tag input_time, input_time.strftime('%l:%M %p %Z')
  end
end
