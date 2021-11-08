class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]
  before_action :is_user_logged_in?

  # GET /projects or /projects.json or /projects.xml
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json or /projects/1.xml
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: "Project was successfully created." }
        # format.json { render :show, status: :created, location: @project }
        format.xml  { render xml: @project}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
        format.xml  { render xml: @project}
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def is_user_logged_in?
      if session[:user].nil?
        flash[:notice] = "You are not logged in"
        redirect_to :controller => "user", :action => "login" 
      end
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:project_name, :duration, :status, :employee_id)
    end
end
