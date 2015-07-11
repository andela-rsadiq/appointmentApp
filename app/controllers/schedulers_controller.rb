class SchedulersController < ApplicationController
  def index
    @schedulers = Scheduler.all
  end

  def new
    @scheduler = Scheduler.new
  end

  def show
    @scheduler = Scheduler.find(params[:id])
  end

  def create
    @scheduler = Scheduler.create(scheduler_params)
    if @scheduler.save
      redirect_to schedulers_path
    else
      render 'new'
    end
  end

  private
    def scheduler_params
      params.require(:scheduler).permit(:name, :role)
    end
end
