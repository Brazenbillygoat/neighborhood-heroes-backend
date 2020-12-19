class CompletedTasksController < ApplicationController


  def log_task
    if params["task_id"] == nil
      task = Task.all.find_by(name: params["task_name"])
      
      logged_task = CompletedTask.new(
        task_id: task.id,
        user_id: params["user_id"].to_i
      )
    else 
      logged_task = CompletedTask.new(
        task_id: params["task_id"].to_i,
        user_id: params["user_id"].to_i
      )
    end
    if logged_task.save
      render json: logged_task
    end
  end

end