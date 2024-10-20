require "sinatra"
require "sinatra/reloader"

get("/howdy") do
erb(:hello)
end

get("/goodbye") do
  erb(:bye)
  end
  
#TEMPLATE
get("/square/new") do
  erb(:new_square_calc)
end

get '/square/results' do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 2
  erb(:square_results)
end
#TEMPLATE

#
get("/square_root/new") do
  erb(:new_root_calc)
end

get '/square_root/results' do
  @the_num = params.fetch("users_number").to_f
  @the_result = Math.sqrt(@the_num)
  erb(:root_results)
end
#

#RANDOM
get("/random/new") do
  erb(:random_calc)
end

get '/random/results' do
  @minimum = params.fetch("users_number").to_f
  @maximum = params.fetch("users_number_two").to_f

  @result = rand(@minimum..@maximum)
  erb(:random_results)
end


get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
