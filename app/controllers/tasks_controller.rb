class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end
  
  def create
    Task.create(task_params)
    redirect_to clients_path, notice: "案件を新規作成しました！"
  end

  private

  def task_params
    params.require(:task).permit(:task_name, :task_day, 
                                 :task_payment_year, :task_payment_month, 
                                 :task_payment, :task_content)
  end

end
