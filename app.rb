
require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/profile')
require('./lib/videogame')
require('./lib/opinions')
require('pry')
require("pg")

get("/") do
  erb(:index)
end

get('/login') do
  erb(:login)
end
get("/profile") do
  erb(:profile)
end

get('/profile/:id') do
  id = params.fetch("id").to_i

  @profile = Profile.find(id)
  erb(:profile)
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

  if @profile != nil
    @profile = Profile.find_by(:username => username, :password => password)
    erb(:profile)
  else
    erb(:error)
  end
end

get("/add_videogame/:id") do
  id = params.fetch("id").to_i
  @profile = Profile.find(id)
  erb(:add_videogame_form)
end

post("/add_videogame") do
  game_name = params.fetch("game_name")
  Videogame.create(:game_name => game_name)
  redirect("/add_videogame")
end
get('/videogame_list/:id') do
  @videogames = Videogame.all()
  erb(:videogame_list)
end

get('/videogames/:id')do
  id = params.fetch("id").to_i
  @videogame = Videogame.find(id)

  erb(:videogame)
end
