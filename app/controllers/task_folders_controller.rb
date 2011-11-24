class TaskFoldersController < ApplicationController
  # GET /task_folders
  # GET /task_folders.json
  def index
    @task_folders = TaskFolder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @task_folders }
    end
  end

  # GET /task_folders/1
  # GET /task_folders/1.json
  def show
    @task_folder = TaskFolder.find(params[:id])
    @project = @task_folder.project

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task_folder }
    end
  end

  # GET /task_folders/new
  # GET /task_folders/new.json
  def new
    @task_folder = TaskFolder.new
    @project = @task_folder.project

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task_folder }
    end
  end

  # GET /task_folders/1/edit
  def edit
    @task_folder = TaskFolder.find(params[:id])
    @project = @task_folder.project
  end

  # POST /task_folders
  # POST /task_folders.json
  def create
    taskfolderparams = params[:task_folder]
	@project = Project.find(taskfolderparams[:project_id])
	taskfolderparams[:project] = @project
	taskfolderparams[:parent] = nil
    @task_folder = TaskFolder.new(taskfolderparams)

    respond_to do |format|
      if @task_folder.save
        format.html { redirect_to task_folder_url(@task_folder), notice: 'Task folder was successfully created.' }
        format.json { render json: @task_folder, status: :created, location: @task_folder }
      else
        format.html { render action: "new" }
        format.json { render json: @task_folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /task_folders/1
  # PUT /task_folders/1.json
  def update
    @task_folder = TaskFolder.find(params[:id])

    respond_to do |format|
      if @task_folder.update_attributes(params[:task_folder])
        format.html { redirect_to task_folder_url(@task_folder), notice: 'Task folder was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @task_folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_folders/1
  # DELETE /task_folders/1.json
  def destroy
    @task_folder = TaskFolder.find(params[:id])
    project = @task_folder.project
    @task_folder.destroy

    respond_to do |format|
      format.html { redirect_to task_folders_project_url(project) }
      format.json { head :ok }
    end
  end

  # GET /task_folders/1/tasks
  def tasks
    @tasks = Task.find(:all, :conditions => { :task_folder_id => params[:id] })
	@task_folder = TaskFolder.find(params[:id])
	@project = Project.find(@task_folder.project_id)

	render '/tasks/index'
  end

  # GET /task_folders/1/tasks/new
  def tasks_new
    @task_folder = TaskFolder.find(params[:id])
    @task = @task_folder.tasks.build
	@project = Project.find(@task_folder.project_id)

    render '/tasks/new'
  end

end
