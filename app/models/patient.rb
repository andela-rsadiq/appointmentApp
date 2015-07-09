class Patient < ActiveRecord::Base
  has_many :appointments
  has_many :schedules, through: :appointment
end
