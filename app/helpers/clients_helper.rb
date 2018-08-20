module ClientsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_clients_path
    elsif action_name == 'edit'
      client_path
    end
  end
end
