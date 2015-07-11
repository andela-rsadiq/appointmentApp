class AppointmentsController < ApplicationController
  before_action :load_patient, except: [:index]
  before_action :build_appointment_params,  only: [ :new]
  before_action :build_appointment_from_params, only: [:create]

  def home
  end

  def index
    @appointments = Appointment.all
  end

  def new
    @appointment =  Appointment.new(patient: @patient)
  end

  def create
    if @appointment.save
      redirect_to patient_path(params[:patient_idq])

    elsif
      render 'new'
    end
  end

  def load_patient
    @patient = Patient.find(params[:patient_id])
  end

  def build_appointment_params
    @appointment =  Appointment.new(patient: @patient)
  end

  def build_appointment_from_params
    @appointment = @patient.appointments.build(appointment_params)
  end

  private
    def appointment_params
      params.require(:appointment).permit(:patient_id, :scheduler_id, :reason, :appointment_date, :appointment_time)
    end
end
