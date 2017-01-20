class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]
  
  respond_to :html
  respond_to :js

  def complete
    @tasks = Task.all
    @task = Task.find(params[:id])
    @task.mark_complete!
  end

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    respond_with(@tasks)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  #noy hay show
  #def show
  #  
  #end

  # GET /tasks/new
  def new
    @task = Task.new
    respond_with(@task)
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @tasks = Task.all
    @task = Task.new(task_params)
    @task.save
    
      if params[:complete]
        @task.mark_complete!
      end
        
    respond_with(@task)
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task.update(task_params)
    respond_with(@task)
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
     @tasks = Task.all 
     @task.destroy
     respond_with(@task)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name,:complete,:id,:foto,:remove_foto)
    end
end
