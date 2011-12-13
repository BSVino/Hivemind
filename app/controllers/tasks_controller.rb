class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
    @project = @task.project

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
    @project = @task.project

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
	@task_folder = @task.task_folder
    @project = @task.project
  end

  # POST /tasks
  # POST /tasks.json
  def create
    taskparams = params[:task]
	@project = Project.find(taskparams[:project_id])
	@task_folder = TaskFolder.find(taskparams[:task_folder_id])
	taskparams[:project] = @project
	taskparams[:task_folder] = @task_folder
    @task = Task.new(taskparams)

    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    taskparams = params[:task]
	@project = Project.find(taskparams[:project_id])
	@task_folder = TaskFolder.find(taskparams[:task_folder_id])

	taskparams[:project] = @project
	taskparams[:task_folder] = @task_folder

    respond_to do |format|
      if @task.update_attributes(taskparams)
        format.html { redirect_to task_url(@task), notice: 'Task was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    task_folder = @task.task_folder
    @task.destroy

    respond_to do |format|
      format.html { redirect_to task_folder_url(task_folder) }
      format.json { head :ok }
    end
  end
end
