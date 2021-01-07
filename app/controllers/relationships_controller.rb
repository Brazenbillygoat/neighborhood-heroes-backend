class RelationshipsController < ApplicationController

  def index
    # need to make specific to current user
    # render json: Relationship.all
  end

  def create
    association = Relationship.new(
      follower_id: params["follower_id"].to_i,
      followed_id: params["followed_id"].to_i
    )
    if association.save
      render json: association
    end
  end

  def delete
    Relationship.find_by(
      follower_id: params["follower_id"],
      followed_id: params["followed_id"]
    ).destroy
    Relationship.find_by(
      follower_id: params["followed_id"],
      followed_id: params["follower_id"]
    ).destroy
  end

end