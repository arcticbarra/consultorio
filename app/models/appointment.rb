class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  enum appointment_type: %i[first_time revision therapy]

  def duration
    if first_time?
      30
    elsif revision?
      15
    else
      60
    end
  end
end
