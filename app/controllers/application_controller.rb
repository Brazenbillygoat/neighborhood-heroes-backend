 class ApplicationController < ActionController::API

  
  def secret_key
    # THIS IS A PLACEHOLDER, I NEED TO MOVE THIS INTO
    # ENVIROMENT VARIABLES BEFORE PRODUCTION
    "secret"
  end

  def encode(payload)
    JWT.encode(payload, secret_key, "HS256")
  end

  def decode(token)
    JWT.decode(token, secret_key, true, {algorithm: "HS256"})[0]
  end

  def tournament_points(tournament_id)
    current_winner = {
      name: "",
      points: 0
    } 

    tournament_users = User.all.map do |user|
      user_points = 0;
      user.tasks.each do |task|
        if task.tournament_id == tournament_id
          user_points += task.points
        end
      end
      if user_points > current_winner[:points]
        current_winner = {
          name: user.username,
          points: user_points
        }
      end
    end
    return current_winner
  end

end
