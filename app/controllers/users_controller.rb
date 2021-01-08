class UsersController < ApplicationController

  def index
    users = User.all
    render json: users.to_json( {include: [:completed_tasks, :tournaments, :tasks, :followers]})
  end

  def show
    # user = User.find_by()
  end

  def process_login

    user = User.find_by(username: params["name"])
    if user && user.authenticate(params["password"])
      render json: user.to_json( {include: [:completed_tasks, :tournaments, :tasks, :followers]})
    else
      render json: "No user found"
    end

  end

  def create_friendship
    

    
  end

  def create
    if User.find_by(username: params["name"])
      render json: "This username is taken"
    else
      user = User.create(username: params["name"],
                      password: params["password"])
      render json: user.to_json( {include: [:tasks, :tournaments]})
    end

  end

  def delete

  end

end