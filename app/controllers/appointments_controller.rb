class AppointmentsController < ApplicationController
  before_action :load_patient, except: [:index]
  before_action :build_appointment_params,  only: [ :new]
  before_action :build_appointment_from_params, only: [:create]
  before_action :load_appointment, only: [:show, :edit, :destroy, :update]

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
      redirect_to patient_path(@patient)

    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to patient_path(@patient)
    else
      render 'edit'
    end
  end

  def destroy
     if @appointment.destroy
       flash[:notice] = 'Appointment has been deleted!'
       redirect_to patient_path(@patient)
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

  def load_appointment
    @appointment =  @patient.appointments.find(params[:id])
  end

  private
    def appointment_params
      params.require(:appointment).permit(:patient_id, :scheduler_id, :reason, :appointment_date, :appointment_time)
    end
end
