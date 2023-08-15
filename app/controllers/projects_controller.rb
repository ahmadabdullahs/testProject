class ProjectsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @projects = Project.all
    flash.now[:notice] = "List of projects of this user."
  end

  def new
    @project = Project.new
    flash.now[:notice] = "Create a new project."
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def show 
    @project = Project.find(params[:id])
    flash.now[:notice] = "Details of this Project."
  end

  def edit
    @project = Project.find(params[:id])
    flash.now[:notice] = "Edit the project."
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      puts @project.errors.full_messages
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.user_projects.destroy_all
    @project.destroy
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:name, :manager_id, developer_ids: [], qa_ids: [])
  end
  
end
