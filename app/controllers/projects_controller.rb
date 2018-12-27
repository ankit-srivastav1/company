class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy, :edit, :assign_task]

  def index
    @projects = Project.all
  end

  def new
    @project=Project.new

  end

  def show
    @project = Project.find(params[:id])
    #  @tasks =  @project.tasks
    @offices =  @project.office
  end

  def create
    #if @project.save
    redirect_to offices_path(@office)
  end


  def assign_project
    redirect_to offices_path(@office)
  end

  def assign_task
    @user = User.find(params[:user_id])
    puts "---------#{params[:user_id]}"
    puts"---#{@user.inspect}"


  #  puts "---------#{params[:id]}"
    puts"---#{@project.inspect}"



   @task = Task.find(params[:task_id])
    @user.tasks << @task
   if @user.present? &&  @task.present?


      redirect_to offices_path
    else
      redirect_to tasks_path
    end
  end

  private

  def set_project
    puts "****************************************"
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:pname,:office_id)
  end
end
