class Api::V1::TasksController < ApplicationController

  def index
    @tasks = Task.all
    render json: TaskSerializer.new(@tasks).serializable_hash[:data].map { |task| task[:attributes] }
  end

  def show
    @task = Task.find(params[:id])
    if @task
      render json: TaskSerializer.new(@task).serializable_hash[:data][:attributes], status: :ok
    end
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: TaskSerializer.new(@task).serializable_hash[:data][:attributes], status: :created
    else
      render json: {errors: @task.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_oarams)
      render json: TaskSerializer.new(@task).serializable_hash[:data][:attributes], status: :ok
    else
      render json: {errors: @task.errors.full_messages}
    end
  end

end
