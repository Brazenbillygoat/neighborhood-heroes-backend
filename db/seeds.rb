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
  profile_pic: Faker::Avatar.image
)

jonathan = User.create(username: "Jonathan",
  email: "hyrum.butler3@gmail.com", 
  password: "password",
  zipcode: "23220",
  profile_pic: Faker::Avatar.image
)

15.times{ User.create(username: Faker::Name.name,
  email: "hyrum.butler3@gmail.com", 
  password: "password",
  zipcode: "23220",
  profile_pic: Faker::Avatar.image
)}
userIdsArray = User.all.map do |user|
  user.id
end

tourney = Tournament.create(name: "Weekend Cleanup",
  description: "Sanitary collection equipment will be provided, as well as refreshments.
  Just bring your smile.",
  creator_id: hyrum.id,
  start_date: "November 17, 2020 16:35",
  end_date: "December 18, 2021 16:35"
)
tourney2 = Tournament.create(name: "Keep the coffee coming",
  description: "Tasks involved with keeping the coffee pot full. The winner gets a starbucks gift card.",
  creator_id: hyrum.id,
  start_date: "November 17, 2020 16:35",
  end_date: "December 18, 2021 16:35"
)
tourney3 = Tournament.create(name: "Caring for the puppy",
  description: "The new puppy needs to be trained and loved.",
  creator_id: hyrum.id,
  start_date: "November 17, 2020 16:35",
  end_date: "December 18, 2021 16:35"
)
tourney4 = Tournament.create(name: "Clean the kitchen",
  description: "Dinner was great! Now for the fun part... right?",
  creator_id: hyrum.id,
  start_date: "November 17, 2020 16:35",
  end_date: "December 18, 2021 16:35"
)
tourney5 = Tournament.create(name: "Keep the coffee coming",
  description: "Tasks involved with keeping the coffee pot full. The winner gets a starbucks gift card.",
  creator_id: hyrum.id,
  start_date: "November 17, 2020 16:35",
  end_date: "November 18, 2020 16:35"
)
tourney6 = Tournament.create(name: "The great week of running",
  description: "Two colleagues thought they could run further than eachother within one week. Thus began, 'The great week of running'.",
  creator_id: hyrum.id,
  start_date: "November 17, 2020 16:35",
  end_date: "December 18, 2020 16:35"
)
tournamentIdsArray = Tournament.all.map do |tournament|
  tournament.id
end

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

grind_coffee = Task.create(name: "Grind some fresh beans",
  creator_id: hyrum.id,
  points: 115,
  limit: 20,
  tournament_id: tourney5.id
)
mile_run = Task.create(name: "one mile",
  creator_id: hyrum.id,
  points: 5,
  limit: 20,
  tournament_id: tourney6.id
)
five_mile_run = Task.create(name: "five miles",
  creator_id: hyrum.id,
  points: 35,
  limit: 20,
  tournament_id: tourney6.id
)

# ADDING TOURNAMENT MEMBER WITH COMPLETED TASK
15.times{ newComp = Competition.new(
  tournament_id: tournamentIdsArray.sample(),
  user_id: userIdsArray.sample()
)
if Competition.all.find {|comp| comp.tournament_id == newComp.tournament_id && comp.user_id == newComp.user_id }
  next
else
  newComp.save()
end
}
Competition.create(
  tournament_id: tourney.id,
  user_id: jonathan.id
)

CompletedTask.create(
  task_id: separate_recycling.id,
  user_id: jonathan.id
)
Competition.create(
  tournament_id: tourney5.id,
  user_id: hyrum.id
)

CompletedTask.create(
  task_id: grind_coffee.id,
  user_id: hyrum.id
)

Competition.create(
  tournament_id: tourney6.id,
  user_id: jonathan.id
)

CompletedTask.create(
  task_id: five_mile_run.id,
  user_id: jonathan.id
)