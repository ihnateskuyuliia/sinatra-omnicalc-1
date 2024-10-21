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

#ROOT
get("/square_root/new") do
  erb(:new_root_calc)
end

get '/square_root/results' do
  @the_num = params.fetch("users_number").to_f
  @the_result = Math.sqrt(@the_num)
  erb(:root_results)
end
#ROOT

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
#RANDOM


#PAYMENT
get("/payment/new") do
  erb(:payment_calc)
end

get '/payment/results' do
  @apr = params.fetch("user_apr").to_f
  @r = @apr / 100 / 12
  @years = params.fetch("user_years").to_i
  @value = params.fetch("user_pv").to_f
  
  # Calculate the number of monthly periods
  @n = @years * 12

  # Organize the numerator and denominator according to the formula
  @numerator = @r * @value
  @denominator = 1 - (1 + @r) ** -@n

  # Calculate the monthly payment (P)
  @monthly_payment = @numerator / @denominator

  #Format the Principal Value
  @value_formatted = @value.to_fs(:currency)
  
  # Format the result as currency
  @formatted_payment = @monthly_payment.to_fs(:currency)

  #Format the APR
  @apr_formatted = @apr.to_fs(:percentage, {:precision => 4})
  erb(:payment_results)
end
#PAYMENT

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
