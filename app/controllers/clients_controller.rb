class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :session_client, only: [:edit, :update, :destroy, :create, :new, :index]

  def index
    @clients = Client.all
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
      redirect_to clients_path, notice: "クラインアトを新規作成しました！"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @client.update(client_params)
      redirect_to clients_path, notice: "編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path, notice:"削除しました！"
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

  def session_client
    if logged_in?
    else
      render new_session_path  
    end
  end

end
