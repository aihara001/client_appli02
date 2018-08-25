class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]

  def new
    if params[:back]
      @task = Task.new(task_params)
    else
      @task = Task.new
    end
  end

  def create
    @client = Client.find_by(params[:id])
    @task = @client.tasks.build(task_params)
    if @task.save
      redirect_to clients_path, notice: "案件を新規作成しました！"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to clients_path, notice: "編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to clients_path, notice:"削除しました！"
  end

  def confirm
    @task = Task.new(task_params)
  end

  private

  def task_params
    params.require(:task).permit(:task_name, :task_day, 
                                 :task_payment_year, :task_payment_month, 
                                 :task_payment, :task_content)
  end

  def set_task
     @task = Task.find(params[:id])
  end

end