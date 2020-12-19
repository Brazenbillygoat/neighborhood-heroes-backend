class CompetitionsController < ApplicationController

  def index

  end


  def create
    
    if Competition.find_by(
      user_id: params["user_id"].to_i,
      tournament_id: params["tournament_id"].to_i
    )
      render json: {error: 1}
    else
      
      participant = Competition.new(
        user_id: params["user_id"].to_i, 
        tournament_id: params["tournament_id"].to_i
      )      
      if participant.save 
        render json: participant
      else
        render json: {error: "Couldn't add, server issues."}
      end
    end
  end

  def delete
    Competition.delete_by(
      user_id: params["user_id"].to_i,
      tournament_id: params["tournament_id"].to_i
    )
    tasks_to_delete = Task.all.map do |task|
      task.tournament_id == params["tournament_id"].to_i ? task.id : next
    end
    tasks_to_delete.each do |task_id|  
      CompletedTask.delete_by(
        user_id: params["user_id"].to_i,
        task_id: task_id
      )
    end
  end


end