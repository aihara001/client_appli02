module TasksHelper
  def choose_new_or_edit_tasks
    if action_name == 'new'
      client_tasks_path(@client)
    elsif action_name == 'edit'
      client_task_path(@client,@task)
    end
  end
end
