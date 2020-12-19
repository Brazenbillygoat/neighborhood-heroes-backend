class TasksController < ApplicationController



  def create
    task = Task.new(
      name: params["name"],
      description: params["description"],
      points: params["points"],
      tournament_id: params["tournament_id"],
      creator_id: params["creator_id"]
    )
    if task.save
      render json: task
    else
      render json: {error: "it didn't save"}
    end
  end

  def delete
    Task.find(params["task_id"]).destroy
  end


end