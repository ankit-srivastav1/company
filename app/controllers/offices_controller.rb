class OfficesController < ApplicationController

  def index
    @offices = Office.all
  end

  def new
    @office=Office.new
  end

  def show
    @office = Office.find(params[:id])
    @projects =  @office.projects
  end


  def create
    @office = Office.new(project_params)
    if @office.save
      redirect_to project_path(@office)
    else
      flash[:success] = "record created"
      render :action => 'new'
    end
  end

  def login
  end

  # def office_projects
  # @office = Office.project
  # end

  private

  def project_params
    params.require(:project).permit(:oname)
  end
end
