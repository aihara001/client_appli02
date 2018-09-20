class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :access_permission, except: [:show]

  def index
    @search = Client.search(params[:q])
    @clients = @search.result
  end
  
  def new
    if params[:back]
      @client = Client.new(client_params)
    else
      @client = Client.new
    end
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path, notice: "クライアントを新規作成しました！"
    else
      render :new
    end
  end

  def show
    @tasks = @client.tasks
    @payment01 = Task.where(client_id: @client).where(task_payment_month: '1').sum(:task_payment)
    @payment02 = Task.where(client_id: @client).where(task_payment_month: '2').sum(:task_payment)
    @payment03 = Task.where(client_id: @client).where(task_payment_month: '3').sum(:task_payment)
    @payment04 = Task.where(client_id: @client).where(task_payment_month: '4').sum(:task_payment)
    @payment05 = Task.where(client_id: @client).where(task_payment_month: '5').sum(:task_payment)
    @payment06 = Task.where(client_id: @client).where(task_payment_month: '6').sum(:task_payment)
    @payment07 = Task.where(client_id: @client).where(task_payment_month: '7').sum(:task_payment)
    @payment08 = Task.where(client_id: @client).where(task_payment_month: '8').sum(:task_payment)
    @payment09 = Task.where(client_id: @client).where(task_payment_month: '9').sum(:task_payment)
    @payment10 = Task.where(client_id: @client).where(task_payment_month: '10').sum(:task_payment)
    @payment11 = Task.where(client_id: @client).where(task_payment_month: '11').sum(:task_payment)
    @payment12 = Task.where(client_id: @client).where(task_payment_month: '12').sum(:task_payment)
  end

  def edit
  end

  def update
    if @client.update(client_params)
      redirect_to clients_path, notice: "クライアントを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path, notice:"クライアントを削除しました！"
  end

  def confirm
    @client = Client.new(client_params)
    render :new if @client.invalid?
  end

  private

  def client_params
    params.require(:client).permit(:client_name, :client_content)
  end

  def set_client
    @client = Client.find(params[:id])
  end

  def access_permission
    if logged_in?
    else
      render new_session_path  
    end
  end

end
