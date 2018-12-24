class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    
  end
  def new
    @project=Project.new
  end

  def show
    @project = Project.find(params[:id])
    #  @tasks =  @project.tasks
    @offices =  @project.offices
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      flash[:success] = "record created"
      render :action => 'new'
    end
  end



  def assign_project

      redirect_to offices_path(@office)
    end

  private

  # def set_project
  #   @project = Project.find(params[:project_id])
  # end

  def project_params
    params.require(:project).permit(:pname,:office_id)
  end
end
