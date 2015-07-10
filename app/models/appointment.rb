class Appointment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :scheduler

  def check_scheduler
    scheduler ? self.scheduler.name : ""
  end
end
