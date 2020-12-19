require 'faker'

User.destroy_all
Task.destroy_all
Tournament.destroy_all
Competition.destroy_all
CompletedTask.destroy_all

Faker::Name.name

hyrum = User.create(username: "Hyrum",
  email: "hyrum.butler3@gmail.com", 
  password: "password",
  zipcode: "23220",
  profile_pic: "TBD"
)

jonathan = User.create(username: "Jonathan",
  email: "hyrum.butler3@gmail.com", 
  password: "password",
  zipcode: "23220",
  profile_pic: "TBD"
)

15.times{ User.create(username: Faker::Name.name,
  email: "hyrum.butler3@gmail.com", 
  password: "password",
  zipcode: "23220",
  profile_pic: "TBD"
)}

tourney = Tournament.create(name: "Weekend Cleanup",
  description: "Sanitary collection equipment will be provided, as well as refreshments.
  Just bring your smile.",
  creator_id: hyrum.id,
  start_date: "November 17, 2020 16:35",
  end_date: "December 18, 2020 16:35"
)
tourney2 = Tournament.create(name: "Keep the coffee coming",
  description: "Tasks involved with keeping the coffee pot full. The winner gets a starbucks gift card.",
  creator_id: hyrum.id,
  start_date: "November 17, 2020 16:35",
  end_date: "December 18, 2020 16:35"
)
Tournament.create(name: "Keep the coffee coming",
  description: "Tasks involved with keeping the coffee pot full. The winner gets a starbucks gift card.",
  creator_id: hyrum.id,
  start_date: "November 17, 2020 16:35",
  end_date: "November 18, 2020 16:35"
)

Task.create(name: "Pick up litter",
  creator_id: hyrum.id,
  points: 5,
  limit: 20,
  tournament_id: tourney.id
)
Task.create(name: "Rake leaves",
  creator_id: hyrum.id,
  points: 15,
  limit: 20,
  tournament_id: tourney.id
)
separate_recycling = Task.create(name: "Separate recycling",
  creator_id: hyrum.id,
  points: 55,
  limit: 20,
  tournament_id: tourney.id
)
Task.create(name: "Weed the community garden",
  creator_id: hyrum.id,
  
  points: 115,
  limit: 20,
  tournament_id: tourney.id
)
       
# ADDING TOURNAMENT MEMBER WITH COMPLETED TASK
Competition.create(
  tournament_id: tourney.id,
  user_id: jonathan.id
)

CompletedTask.create(
  task_id: separate_recycling.id,
  user_id: jonathan.id
)