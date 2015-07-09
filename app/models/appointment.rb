class Appointment < ActiveRecord::Base
  belongs_to :patients
  belongs_to :schedulers
end
