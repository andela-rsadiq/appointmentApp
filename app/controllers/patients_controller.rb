class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.create(patient_params)
    if @patient.save
      redirect_to new_patient_appointment_path(@patient)
    else
      render 'new'
    end
  end

  def show
    @patient = Patient.find(params[:id])
  end

  private
    def patient_params
      params.require(:patient).permit(:name)
    end
end
