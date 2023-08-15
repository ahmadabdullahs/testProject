class BugsController < ApplicationController
	before_action :authenticate_user!
  load_and_authorize_resource

	def index
		@project = Project.find(params[:project_id])
		authorize! :read, @project
	  @bugs = @project.bugs
    flash.now[:notice] = "List of Bugs in the '#{@project.name}'."
	end

	def new 
		@project = Project.find(params[:project_id])
		authorize! :read, @project
    @bug = @project.bugs.new
  end
  
  def create
    @project = Project.find(params[:project_id])
    @bug = @project.bugs.new(bugs_params)
    if @bug.save
      redirect_to project_bug_path(@project, @bug), notice: 'Bug was successfully created.'
    else
      render :new
    end
  end

  def show
  	authorize! :read, @bug
  	@project = Project.find(params[:project_id])
    @bug = @project.bugs.find(params[:id])
    flash.now[:notice] = "Detail of this Bug."
  end

  def edit
  	@project = Project.find(params[:project_id])
    @bug = @project.bugs.find(params[:id])
    flash.now[:notice] = "Edit this Bugs."
  end

  def update
  	@project = Project.find(params[:project_id])
    @bug = @project.bugs.find(params[:id])
	  @bug.update(title: params[:bug][:title], status: params[:bug][:status])
	  redirect_to project_bug_path(@project), notice: 'Bug was successfully Updated.'
	rescue
		puts @bug.errors.full_messages
    render :edit
  end

  def destroy
    @project = Project.find(params[:project_id])
    @bug = @project.bugs.find(params[:id])
    @bug.destroy
    redirect_to project_bugs_path(@project), notice: 'Bug was successfully deleted.'
  end

  private
  def bugs_params
    params.permit(:title, :bug_type, :status, :project_id, :user_id, :screenshot, :deadline, :description, :developer_id)
  end
end
