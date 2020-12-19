class TournamentsController < ApplicationController

  def index
    render json: Tournament.all.to_json( {include: [:tasks, users: {include: :tasks}]})
  end

  def show
    tournament = Tournament.find(params["tournament_id"].to_i)
    render json: tournament.to_json( {include: [:tasks, :users]})
  end

  def create
    tourney = Tournament.new(
      name: params["name"],
      description: params["description"],
      start_date: params["startDate"],
      end_date: params["endDate"],
      creator_id: params["creatorId"].to_i
    )
    if tourney.save
      render json: tourney
    else
      render json: "I didn't save."
    end
  end

end