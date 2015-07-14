class PatientMailer < ApplicationMailer
  default from: 'hospital@andela.com'

  def notification_mail(patient)
    @patient = patient
    @url = 'http:appointment-scheduling.herokuapp.com'
    mail(to: @patient.email, subject: 'Appointment Notification')
  end
end
