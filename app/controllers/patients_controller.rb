class PatientsController < ApplicationController
  before_action :set_patient, :only  => [:show, :destroy]
  def index
    if params[:search]
      @patients = Patient.search(params[:search])
    else
      @patients = Patient.all
    end
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    # require 'pry'; binding.pry
    if @patient.save
      redirect_to new_patient_appointment_path(@patient)
    else
      render 'new'
    end
  end

  def show

  end

  def destroy
    @patient.destroy
    redirect_to root_url, notice: "Patient has been deleted."
  end


  private
    def patient_params
      params.require(:patient).permit(:name, :sex, :email)
    end

  def set_patient
    @patient = Patient.find(params[:id])
  end
end
