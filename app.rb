
require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/profile')
require('pry')
require("pg")

get("/") do
  erb(:index)
end

get('/login') do
  erb(:login)
end

post("/profile") do

  username = params.fetch("username")
  password = params.fetch("password")

  Profile.create(:username => username, :password => password)

  erb(:success)
end

post('/login') do
  username = params.fetch("username")
  password = params.fetch("password")

  @profile = Profile.find_by(:username => username, :password => password)

  @profilename = @profile.username()

  erb(:profile)
end
