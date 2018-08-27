class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]
  before_action :set_client_id, only: [:new, :create, :edit, :update, :destroy]

  def new
    if params[:back]
      @task = Task.new(task_params)
    else
      @task = Task.new
    end
  end

  def create
    @task = @client.tasks.build(task_params)
    if @task.save
      redirect_to client_path(@client.id), notice: "案件を新規作成しました！"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if  @task.update(task_params)
        redirect_to client_path(@client.id), notice: "案件を編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to client_path(@client.id), notice:"案件を削除しました！"
  end

  private

  def task_params
    params.require(:task).permit(:task_name, :task_day, :client_id,
                                 :task_payment_year, :task_payment_month, 
                                 :task_payment, :task_content)
  end

  def set_task
     @task = Task.find(params[:id])
  end

  def set_client_id
    @client = Client.find(params[:client_id])
  end
  
end