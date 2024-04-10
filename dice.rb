require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
  
# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  erb(:two_six)
end


get("/dice/2/10") do
  first_simulation = rand(1..10)
  second_simulation = rand(1..10)
  result = first_simulation +  second_simulation

  output = "You rolled #{first_simulation} and then #{second_simulation}, adding to #{result}"

  "<h1>2d10</h1> 
  <p>#{output}</p>"
end

get("/dice/1/20") do
  only_simulation = rand(1..20)
  output_1d20 = "You rolled #{only_simulation}"

  "<h1>1d20</h1> 
  <p>#{output_1d20}</p>"
end

get("/dice/5/4") do
  first_simulation_dice5d4 = rand(1..4)
  second_simulation_dice5d4 = rand(1..4)
  third_simulation_dice5d4 = rand(1..4)
  fourth_simulation_dice5d4 = rand(1..4)
  fith_simulation_dice5d4 = rand(1..4)
  result_dice5d4 = first_simulation_dice5d4 +  second_simulation_dice5d4 + third_simulation_dice5d4 + fourth_simulation_dice5d4 + fith_simulation_dice5d4

  output_5d4 = "You first number is  #{first_simulation_dice5d4}, your second #{second_simulation_dice5d4}, your third #{third_simulation_dice5d4}, your fourth #{fourth_simulation_dice5d4}, and your fifth #{fith_simulation_dice5d4}, adding to #{result_dice5d4}"

  "<h1>5d4</h1> 
  <p>#{output_5d4}</p>"
end
