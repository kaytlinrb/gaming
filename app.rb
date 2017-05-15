
require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/profile')
require('./lib/username')
require('./lib/password')
require('pry')
require("pg")

get("/") do
  erb(:index)
end

get('/login') do
  erb(:login)
end

post("/login") do
  username = params.fetch("username")
  password = params.fetch("password")

  @password = Password.find(password)
  password_id = @password.id()
  @username = Username.find(username)
  username_id = @username.id()
  Profile.find(:username_id => username_id, :password => password_id)
  erb(:profile)


  password_id.each_with_index do |id, index|
    username.passwords.push(Password.find(id))

    profile = Profile.where(["username_id = ? and password_id = ?", username.id, id])
    profile.update({:quantity_required => params[:quantity][index], :quantity_units => params[:units][index]})
  end



end


post("/profile") do

  username = params.fetch("username")
  password = params.fetch("password")



  @password = Password.create(:password => password)
  @username = Username.create(:username => username)
Password.find({:username_id => [username.id()]})

  erb(:success)

end
